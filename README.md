cat << 'EOF' > README.md
# Task 3 — Network Packet Sniffing and Analysis

## Files
- task3_capture.pcapng
- suspicious_http3.pcapng
- hashes.txt
- commands.txt
- network_packet_analysis_report_sample.pdf
- fig1_post_packet_list.png
- fig2_arp_opcode2.png
- (optional) fig3_follow_http_stream.png

## How I captured
1. Open Wireshark and select the interface.
2. Start capture and submit a form on http://testphp.vulnweb.com/login.php
3. Stop capture and save full capture as task3_capture.pcapng
4. Apply display filter: http.request.method == "POST"
5. Export displayed packets to suspicious_http3.pcapng
6. Generate SHA256 hashes to verify integrity.

## Key filters
- http.request.method == "POST"
- arp

## Verify
sha256sum -c --quiet hashes.txt && echo "All files OK" || echo "Integrity issue"
EOF

