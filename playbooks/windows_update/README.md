# Start a New Session
screen -S session_name  # Start a named session
screen                  # Start an unnamed session

# Session Management
screen -ls              # List running sessions
screen -r session_name  # Reattach to a session
screen -d session_name  # Detach from a session

# Detach from session (Ctrl+A, then D)



# Example workflow
# Start a new named session
screen -S ansible_updates

# Run your long-running task
ansible-playbook windows_updates.yml

# Detach from session (Ctrl+A, then D)

# Later, reattach to the session
screen -r ansible_updates