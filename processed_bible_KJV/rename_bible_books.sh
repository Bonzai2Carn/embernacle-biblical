#!/bin/bash

# Declare associative array for book abbreviations to full names
declare -A book_names=(
    ["GEN"]="Genesis"
    ["EXO"]="Exodus"
    ["LEV"]="Leviticus"
    ["NUM"]="Numbers"
    ["DEU"]="Deuteronomy"
    ["JOS"]="Joshua"
    ["JDG"]="Judges"
    ["RUT"]="Ruth"
    ["1SA"]="1 Samuel"
    ["2SA"]="2 Samuel"
    ["1KI"]="1 Kings"
    ["2KI"]="2 Kings"
    ["1CH"]="1 Chronicles"
    ["2CH"]="2 Chronicles"
    ["EZR"]="Ezra"
    ["NEH"]="Nehemiah"
    ["EST"]="Esther"
    ["JOB"]="Job"
    ["PSA"]="Psalms"
    ["PRO"]="Proverbs"
    ["ECC"]="Ecclesiastes"
    ["SNG"]="Song of Solomon"
    ["ISA"]="Isaiah"
    ["JER"]="Jeremiah"
    ["LAM"]="Lamentations"
    ["EZK"]="Ezekiel"
    ["DAN"]="Daniel"
    ["HOS"]="Hosea"
    ["JOL"]="Joel"
    ["AMO"]="Amos"
    ["OBA"]="Obadiah"
    ["JON"]="Jonah"
    ["MIC"]="Micah"
    ["NAH"]="Nahum"
    ["HAB"]="Habakkuk"
    ["ZEP"]="Zephaniah"
    ["HAG"]="Haggai"
    ["ZEC"]="Zechariah"
    ["MAL"]="Malachi"
    ["MAT"]="Matthew"
    ["MRK"]="Mark"
    ["LUK"]="Luke"
    ["JHN"]="John"
    ["ACT"]="Acts"
    ["ROM"]="Romans"
    ["1CO"]="1 Corinthians"
    ["2CO"]="2 Corinthians"
    ["GAL"]="Galatians"
    ["EPH"]="Ephesians"
    ["PHP"]="Philippians"
    ["COL"]="Colossians"
    ["1TH"]="1 Thessalonians"
    ["2TH"]="2 Thessalonians"
    ["1TI"]="1 Timothy"
    ["2TI"]="2 Timothy"
    ["TIT"]="Titus"
    ["PHM"]="Philemon"
    ["HEB"]="Hebrews"
    ["JAS"]="James"
    ["1PE"]="1 Peter"
    ["2PE"]="2 Peter"
    ["1JN"]="1 John"
    ["2JN"]="2 John"
    ["3JN"]="3 John"
    ["JUD"]="Jude"
    ["REV"]="Revelation"
)

# Function to rename folders
rename_folders() {
    for folder in */; do
        # Remove trailing slash
        folder=${folder%/}
        
        # Check if abbreviation exists in our mapping
        if [[ -v book_names[$folder] ]]; then
            new_name="${book_names[$folder]}"
            
            # Rename the folder
            if [[ "$folder" != "$new_name" ]]; then
                mv "$folder" "$new_name"
                echo "Renamed: $folder -> $new_name"
            fi
        else
            echo "No mapping found for: $folder"
        fi
    done
}

# Main script
echo "Starting Bible Book Folder Renaming..."
rename_folders
echo "Renaming complete!"
