# =============================================================================
# UNIVERSAL SHELL FUNCTIONS FOR FISH
# =============================================================================

# Function to load environment variables from a .env file in the current directory
function load_dotenv
    set env_file .env
    
    # Check if .env file exists in the current directory
    if test -f $env_file
        echo "Found .env file, loading environment variables..."
        
        # Read the file line by line
        for line in (cat $env_file)
            # Skip comments and empty lines
            if test -z "$line"; or string match -q '#*' "$line"
                continue
            end
            
            # Extract key and value
            if string match -qr '^([^=]+)=(.*)$' "$line"
                set key (string replace -r '^([^=]+)=.*$' '$1' "$line")
                set value (string replace -r '^[^=]+=(.*)$' '$1' "$line")
                
                # Remove quotes if present
                set value (string trim -c '"' "$value")
                set value (string trim -c "'" "$value")
                
                # Export the variable
                set -gx $key $value
                echo "Loaded: $key"
            end
        end
    else
        echo "No .env file found in current directory"
    end
end

# Enhanced cat function - uses bat for interactive terminal, falls back to cat
function cat
    if isatty stdout
        command bat $argv
    else
        command cat $argv
    end
end

# Navigation functions that work with both cd and zoxide
# These will use 'z' if zoxide is available, otherwise fall back to 'cd'
function cx
    if command -v zoxide > /dev/null
        z $argv && ls -la
    else
        cd $argv && ls -la
    end
end

function fcd
    set dir (find . -type d -not -path '*/.*' | fzf)
    if test -n "$dir"
        if command -v zoxide > /dev/null
            z "$dir" && ls -la
        else
            cd "$dir" && ls -la
        end
    end
end

function f
    find . -type f -not -path '*/.*' | fzf | pbcopy
end

function fv
    set file (find . -type f -not -path '*/.*' | fzf)
    if test -n "$file"
        $EDITOR "$file"
    end
end

# Shell switching functions
function tozsh
    exec zsh
end

function tobash
    exec bash
end

function tofish
    exec fish
end

# Google Cloud Platform authentication functions
function gcp-qa
    set creds_file /Users/chaurasiak/Downloads/pco-service-qa-0b89-4b09ed6863b0.json
    set project_id pco-service-qa-0b89
    
    if test -f $creds_file
        set -gx GOOGLE_APPLICATION_CREDENTIALS $creds_file
        set -gx PROJECT_ID $project_id
        gcloud auth activate-service-account --key-file $creds_file --project $project_id
    else
        echo "Credentials file not found: $creds_file"
    end
end

function gcp-dev
    set creds_file /Users/chaurasiak/Downloads/pco-service-dev-34f2-14fe2406be07.json
    set project_id pco-service-dev-34f2
    
    if test -f $creds_file
        set -gx GOOGLE_APPLICATION_CREDENTIALS $creds_file
        set -gx PROJECT_ID $project_id
        gcloud auth activate-service-account --key-file $creds_file --project $project_id
    else
        echo "Credentials file not found: $creds_file"
    end
end

function gcp-prod
    set creds_file /Users/chaurasiak/Downloads/pco-service-prod-613b.json
    set project_id pco-service-prod-613b
    
    if test -f $creds_file
        set -gx GOOGLE_APPLICATION_CREDENTIALS $creds_file
        set -gx PROJECT_ID $project_id
        gcloud auth activate-service-account --key-file $creds_file --project $project_id
    else
        echo "Credentials file not found: $creds_file"
    end
end