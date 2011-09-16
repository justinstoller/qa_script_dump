ssh root@${1} "echo \"perl -pi.bak -e 's/^proxy/#proxy/' /etc/yum.conf ; cd /etc/yum.repos.d/ ; for file in \\\$( ls *.repo ) ; do perl -pi.bak -e 's/enabled=1/enabled=0/' \\\$file ; done ;cd ; vim /etc/yum.repos.d/CentOS-Base.repo\" >todo.sh ; chmod 0744 ~/todo.sh" &&  ssh root@${1}

echo ssh root@${1} \"yum -y install java\"
