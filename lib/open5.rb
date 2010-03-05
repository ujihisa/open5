if RUBY_VERSION < '1.9'
  #abort "Windows doesn't support open5 on ruby 1.8" if /ms/ =~ RUBY_PLATFORM
  require 'rubygems'
  require 'open4'
  def open5(*cmd, &block)
    if block_given?
      Open4.popen4(*cmd) {|pid, i, o, e|
        t = {:pid => pid}
        def t.pid; self[:pid]; end
        block.call i, o, e, t
      }
    else
      pid, i, o, e = Open4.popen4(*cmd)
      t = {:pid => pid}
      def t.pid; self[:pid]; end
      [i, o, e, t]
    end
  end
else
  require 'open3'
  def open5(*cmd, &block)
    Open3.popen3(*cmd, &block)
  end
end
