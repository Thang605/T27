import os

# Paths
base_dir = r"C:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\wwwroot"
html_file = os.path.join(base_dir, "doi-ngu-chuyen-gia.html")
content_file = r"C:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\experts_grid_content.html"

def main():
    # Read the generated content
    with open(content_file, "r", encoding="utf-8") as f:
        new_content = f.read()
        
    # Read the main HTML file
    with open(html_file, "r", encoding="utf-8") as f:
        lines = f.readlines()
        
    # Find the start and end markers
    start_index = -1
    end_index = -1
    
    for i, line in enumerate(lines):
        if 'class="experts-grid"' in line and 'id="expertsGrid"' in line:
            start_index = i
        if start_index != -1 and 'class="no-results"' in line and 'id="noResults"' in line:
            # The closing div of experts-grid should be before this
            # Let's look backwards from here to find the closing div
            # Actually, we know the structure:
            # <div class="experts-grid" id="expertsGrid">
            # ... content ...
            # </div>
            # 
            # <!-- No Results Message -->
            # <div class="no-results" id="noResults">
            
            # So we can just look for the line before "<!-- No Results Message -->" or just find the matching div.
            # But matching div is hard without parsing.
            # Let's rely on the indentation or the known structure from the view_file.
            # In view_file, line 821 is <div class="no-results" id="noResults">.
            # Line 818 is </div>.
            # So we want to replace everything between start_index and the line containing 'class="no-results"'.
            # But we need to keep the wrapper div?
            # The generated content is a list of cards, NOT including the wrapper div?
            # Let's check generate_experts.py.
            # It generates cards.
            # So we need to keep <div class="experts-grid" id="expertsGrid"> and </div>.
            pass

    # Re-scanning for precise insertion points
    # We want to keep the line with 'id="expertsGrid"'
    # And we want to keep the closing '</div>' before 'id="noResults"'
    
    # Let's find the line with id="expertsGrid"
    grid_start_line = -1
    for i, line in enumerate(lines):
        if 'id="expertsGrid"' in line:
            grid_start_line = i
            break
            
    if grid_start_line == -1:
        print("Could not find expertsGrid")
        return

    # Find the start of noResults
    no_results_line = -1
    for i in range(grid_start_line, len(lines)):
        if 'id="noResults"' in line: # This variable 'line' is stale from previous loop? No, I need to iterate again.
             pass
             
    for i in range(grid_start_line, len(lines)):
        if 'id="noResults"' in lines[i]:
            no_results_line = i
            break
            
    if no_results_line == -1:
        print("Could not find noResults")
        return
        
    # The closing div of the grid should be a few lines before noResults.
    # Typically:
    # </div>
    #
    # <!-- No Results Message -->
    # <div class="no-results" ...
    
    # Let's find the last </div> before no_results_line
    grid_end_line = -1
    for i in range(no_results_line - 1, grid_start_line, -1):
        if "</div>" in lines[i]:
            grid_end_line = i
            break
            
    if grid_end_line == -1:
        print("Could not find closing div for expertsGrid")
        return
        
    print(f"Replacing content between line {grid_start_line + 1} and {grid_end_line}")
    
    # Construct new lines
    # lines[:grid_start_line+1] includes the opening div
    # new_content
    # lines[grid_end_line:] includes the closing div and rest of file
    
    final_lines = lines[:grid_start_line+1] + [new_content + "\n"] + lines[grid_end_line:]
    
    with open(html_file, "w", encoding="utf-8") as f:
        f.writelines(final_lines)
        
    print("Successfully updated doi-ngu-chuyen-gia.html")

if __name__ == "__main__":
    main()
