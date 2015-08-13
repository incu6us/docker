#!/bin/bash

__run_supervisord() {
echo "Running the run_supervisord"
supervisord -n
}
__run_supervisord
