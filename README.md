Sinatra Find Template Example
=============================

Shows a problem we faced with `sidekiq-pro` vs `sidekiq-failures`.

https://github.com/mhfs/sidekiq-failures/issues/20

It's a views path situation that happens when two sinatra extensions are registered
and both ovewrite the `find_template` helper.
