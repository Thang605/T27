
file_path = r'c:\Dropbox\DATA\T27\19. Google antigravity\T27\wwwroot\css\styles.css'

with open(file_path, 'rb') as f:
    content = f.read()

print(f"File size: {len(content)} bytes")
print(f"First 100 bytes: {content[:100]}")
print(f"Last 100 bytes: {content[-100:]}")

# Check for null bytes
if b'\x00' in content:
    print("WARNING: Null bytes detected in file!")
else:
    print("No null bytes detected.")
