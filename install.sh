set -e -u

# Update package index and install JRE, MySQL and Node
sudo apt-get update
sudo apt-get -y install default-jre mysql-client nodejs

# Download TeamCity
echo "Download TeamCity..."
mkdir /downloads
cd /downloads
sudo wget http://download.jetbrains.com/teamcity/TeamCity-8.1.5.tar.gz

# Extract TeamCity
echo "Extracting TeamCity..."
cd ../var
sudo tar zxvf ../downloads/TeamCity-8.1.5.tar.gz

# Start TeamCity
echo "Starting Teamcity..."
cd /var/TeamCity
sudo ./bin/runAll.sh start
echo "TeamCity is Running..."

# Add TeamCity as a service
echo "Creating TeamCity service start/stop procedures..."
cat <<'EOF' > /etc/init.d/teamcity
#! /bin/sh
# /etc/init.d/teamcity
#

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting Teamcity "
    /var/TeamCity/bin/runAll.sh start
    ;;
  stop)
    echo "Stopping Teamcity"
    /var/TeamCity/bin/runAll.sh stop
    ;;
  *)
    echo "Usage: /etc/init.d/teamcity {start|stop}"
    exit 1
    ;;
esac

exit 0
EOF
echo "Finished."

# Add TeamCity to startup
echo "Adding Teamcity to boot procedure..."
sudo chmod 755 /etc/init.d/teamcity
sudo update-rc.d teamcity defaults
echo "Finished."

# Fin.
echo "---"
echo "TeamCity available at http://teamcity:8111"
echo "Provisioning completed (^_^)"