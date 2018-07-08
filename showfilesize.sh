
#!/bin/bash
ls -l | awk '{sum += $5} END {print sum/1048576}'
