
file_path = r'c:\Dropbox\DATA\T27\19. Google antigravity\T27\wwwroot\css\styles.css'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

open_braces = content.count('{')
close_braces = content.count('}')

print(f"Open braces: {open_braces}")
print(f"Close braces: {close_braces}")

if open_braces != close_braces:
    print("MISMATCH DETECTED!")
    
    # Find where the mismatch might be
    balance = 0
    for i, char in enumerate(content):
        if char == '{':
            balance += 1
        elif char == '}':
            balance -= 1
        
        if balance < 0:
            print(f"Extra closing brace at character {i}, line {content[:i].count('\\n') + 1}")
            break
            
    if balance > 0:
        print(f"Unclosed brace(s) remaining at end of file. Balance: {balance}")

