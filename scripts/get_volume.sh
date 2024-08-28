#!/bin/bash
amixer get Master | grep -oP '\d+(?=%)' | head -n 1

