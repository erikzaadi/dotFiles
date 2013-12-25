#!/bin/bash
which g$1 > /dev/null && g$1 ${@:2} || $1 ${@:2}
