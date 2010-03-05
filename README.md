# open5

    gem install open5

and

    require 'open5'
    open5('command', 'opt') {|i, o, e, t|
      i.puts 'input!'
      p o.gets
      Process.kill 'KILL', t.pid
    }

or

    require 'open5'
    i, o, e, t = open5('command', 'opt')

## Why open5?

* `open3` doesn't give the pid on ruby 1.8.
* `open4` has different interface to `open3` on ruby 1.9.
* `tasks` doesn't work on Windows because it uses `fork`.

`open5` works both on ruby 1.8 and 1.9, and supports Windows! (Though I've never tested it on Windows yet.)

## Dependency

* `open4`

## Author

Tatsuhiro Ujihisa
