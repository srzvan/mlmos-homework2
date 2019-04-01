#!/bin/bash
butterfly.server.py --host=0.0.0.0 --unsecure --i_hereby_declare_i_dont_want_any_security_whatsoever --shell=/pywumpus.sh

exec "$@"
