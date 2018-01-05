# Previous work
# You have to accept the NDK license. There are 2 ways to do that:
# - Downloading the NDK and changing the ANDROID_HOME variable to the downloaded one.
# - Copying the license folder from an accepted NDK.

export ANDROID_HOME=`pwd`/ndk/

echo "---------------------------------"
echo "-- Welcome to the AndKBD build --"
echo "---------------------------------"
echo ""

# Magisk
echo "## Magisk ##"
echo "Downloading latest Magisk..."
if [ ! -d prebuilts/magisk ]; then
   mkdir prebuilts/magisk
fi
wget http://tiny.cc/latestmagisk

mv latestmagisk prebuilts/magisk/magisk.zip
echo ""

# Substratum
echo "## Substratum ##"
rm substratum/app/build/outputs/apk/release/substratum*.apk
echo "Cloning repo..."
if [ ! -d substratum ]; then
   git clone https://github.com/substratum/substratum.git
   else
   cd substratum
   git pull
fi
./gradlew build
cd ..
if [ ! -d prebuilts/substratum ]; then
   mkdir prebuilts/substratum
fi

mv substratum/app/build/outputs/apk/release/substratum*.apk prebuilts/substratum/Substratum.apk
echo ""

# Start building
echo "## Start building ##"
echo "Let's go!"
source build/envsetup.sh
brunch
