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
