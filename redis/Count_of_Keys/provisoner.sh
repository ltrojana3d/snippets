sudo apt-get install -y python-pip
sudo apt-get install -y redis-server

# If redis-server is not available, roll your own.
# wget http://download.redis.io/releases/redis-4.0.2.tar.gz
# tar -xzf redis-4.0.2.tar.gz
# cd redis-4.0.2/deps
# sudo apt-get update -y
# sudo apt-get install -y make
# sudo apt-get install -y gcc
# sudo apt-get install -y tcl
# sudo make jemalloc linenoise lua hiredis
# ./src/redis-server

for i in {0..299}; do
redis-cli set app01:${i} $RANDOM
done

for i in {0..149}; do
redis-cli set app02:${i} $RANDOM
done

for i in {0..449}; do
redis-cli set app03:${i} $RANDOM
done

redis-cli KEYS '*' | cut -d ':' -f 1 | sort | uniq -c

eval "return #redis.pcall('keys', 'app**:*')" 0
