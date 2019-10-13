#!/bin/bash
sudo date -s @"$(wget -q https://ntp-a1.nict.go.jp/cgi-bin/jst -O - | awk 'NR==4{OFMT="%.6f";print $0+0.1}')"
