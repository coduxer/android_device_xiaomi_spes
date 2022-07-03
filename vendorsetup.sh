export ALLOW_MISSING_DEPENDENCIES=true

CCACHE_DIR='/mnt/ccache'
if [ ! -f /mnt/ccache/ccache.conf ]
then
sudo mount --bind /home/jabiyeff/.ccache ${CCACHE_DIR}
fi
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=${CCACHE_DIR}
