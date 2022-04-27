#/bin/bash
# xinput map-to-output 10 HDMI-4
# xinput map-to-output 20 HDMI-4

# xinput | grep -E '\<Pen\>'
pen="$(xinput | grep -E '\bPen\b' | cut -d'=' -f2 | cut -f1)"
echo "xinput map-to-output $pen HDMI-4"
xinput map-to-output $pen HDMI-4
