Come Fly (With Me) Mode
=======================

  An Emacs mode for working with Sinatra_.

  .. _Sinatra: http://www.sinatrarb.com/

Features:
---------

* Run your Sinatra App in emacs, inside a Comint buffer (e.g. suitable for interactive work with ruby-debug)
* Syntax highlighting superset of your standard Ruby highlighting

Installation:
-------------

(add-to-list 'load-path "/path/to/come-fly")
(require 'come-fly)

Usage:
------

M-x come-fly-mode
M-x sinatra-server

**Hint** - Running the server only works if your file is executable, so chmod yourself...

Planned:
--------

* Hook to Auto-detect require 'sinatra'
* Imenu integration for your Routes
* sinatra.el inspired 'console'

Bugs:
-----

Use the Github tracker please

License:
--------

GPL.

You're Welcome

Similar:
--------

Eric Schulte also has sinatra.el [1] which you may find interesting...

[1] https://github.com/eschulte/sinatra_el