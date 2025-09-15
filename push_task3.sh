#!/bin/bash

# Set variables
REPO_NAME="network-packet-sniffing"
GITHUB_USER="ifaaaaz"
GITHUB_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"
TASK_FOLDER=~/task3-github
PAT="YOUR_PERSONAL_ACCESS_TOKEN"  # Replace with your GitHub PAT

# 1. Go to task folder
mkdir -p "$TASK_FOLDER"
cd "$TASK_FOLDER" || exit

# 2. Create / update README.md
cat << 'EOF' > README.md
# Task 3 — Network Packet Sniffing and Analysis

## Author
ifaaaaz

## Files
- `task3_capture.pcapng`  
- `suspicious_http3.pcapng`  
- `hashes.txt`  
- `commands.txt`  
- `network_packet_analysis_report_sample.pdf`  
- `fig1_post_packet_list.png`  
- `fig2_arp_opcode2.png`  
- (optional) `fig3_follow_http_stream.png`

## How I captured
1. Open Wireshark and select the network interface.  
2. Start capturing packets.  
3. Submit a form on [http://testphp.vulnweb.com/login.php](http://testphp.vulnweb.com/login.php).  
4. Stop the capture and save the full capture as `task3_capture.pcapng`.  
5. Apply display filter: `http.request.method == "POST"` or `arp`.  
6. Export displayed packets as `suspicious_http3.pcapng`.  
7. Generate SHA256 hashes in `hashes.txt` to verify integrity.

## Key Filters
- `http.request.method == "POST"`  
- `arp`  
- `arp.opcode == 2`  

## Verify
\`\`\`bash
sha256sum -c --quiet hashes.txt && echo "All files OK" || echo "Integrity issue"
\`\`\`
EOF

# 3. Create commands.txt (if not already)
cat << 'EOF' > commands.txt
# Commands used for Task 3

# Show files and hashes
ls -l task3_capture.pcapng suspicious_http3.pcapng hashes.txt

# Verify SHA256 hashes
sha256sum -c --quiet hashes.txt && echo "All files OK" || echo "Integrity issue"

# Optional: extract POST bodies using tshark
tshark -r task3_capture.pcapng -Y 'http.request.method == "POST"' -T fields -e frame.number -e frame.time -e ip.src -e ip.dst -e http.host -e http.request.uri -e http.file_data
EOF

# 4. Create .gitignore
cat << 'EOF' > .gitignore
task3-venv/
*.pyc
__pycache__/
.DS_Store
Thumbs.db
EOF

# 5. Initialize Git if needed
if [ ! -d ".git" ]; then
    git init
    git branch -M main
    git remote add origin "$GITHUB_URL"
fi

# 6. Add all files and commit
git add .
git commit -m "Finalize Task 3: README, commands, PDF, screenshots, hashes"

# 7. Push to GitHub using token
# This sets the token in the URL temporarily for push
git push https://$GITHUB_USER:$PAT@github.com/$GITHUB_USER/$REPO_NAME.git main

echo "Task 3 repo is finalized and pushed successfully!"
