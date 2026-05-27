docker run -d \
  --name=motioneye \
  -p 8765:8765 \
  -v /etc/motioneye:/etc/motioneye \
  -v /var/lib/motioneye:/var/lib/motioneye \
  --restart=unless-stopped \
  ccrisan/motioneye:master-amd64
