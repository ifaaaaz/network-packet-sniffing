from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet

doc = SimpleDocTemplate("network_packet_analysis_report_sample.pdf", pagesize=A4)
styles = getSampleStyleSheet()
story = []

story.append(Paragraph("Network Packet Sniffing and Analysis - Sample Report", styles["Title"]))
story.append(Spacer(1,12))
story.append(Paragraph("Objective: Capture and analyze network traffic to identify credentials or suspicious activity.", styles["Normal"]))
story.append(Paragraph("Files: task3_capture.pcapng, suspicious_http3.pcapng, hashes.txt", styles["Normal"]))
story.append(Paragraph("Finding: Plaintext credentials visible in HTTP POST packets.", styles["Normal"]))
story.append(Paragraph("Screenshots included: fig1_post_packet_list.png, fig2_arp_opcode2.png", styles["Normal"]))
story.append(Paragraph("Recommendation: Use HTTPS/TLS, strong passwords, and multi-factor authentication.", styles["Normal"]))

doc.build(story)

