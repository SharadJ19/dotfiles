cat << 'EOF' > install_root_configs.sh
#!/usr/bin/env bash
echo "Installing system-level configurations..."
sudo cp -r etc/modprobe.d/* /etc/modprobe.d/
echo "Done! Modprobe configurations updated."
EOF
