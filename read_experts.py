import pandas as pd
import json
import sys

# Set encoding to utf-8 for output
sys.stdout.reconfigure(encoding='utf-8')

file_path = r"C:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\Input\Yêu cầu nhập thông tin cho website.xlsx"

try:
    # Read the Excel file
    # Assuming the data is in the first sheet. If not, we might need to specify sheet_name.
    df = pd.read_excel(file_path)
    
    # Clean column names (strip whitespace)
    df.columns = df.columns.str.strip()
    
    # Replace NaN with None for valid JSON
    df = df.where(pd.notnull(df), None)
    
    # Convert to list of dicts
    data = df.to_dict(orient='records')
    
    # Print JSON
    print(json.dumps(data, ensure_ascii=False, indent=2))

except Exception as e:
    print(f"Error reading Excel file: {e}")
