FROM openjdk:11-jdk
MAINTAINER Benoît HAGENBOURGER "benoit@hagenbourger.fr"

ENV ANDROID_COMPILE_SDK "31"
ENV ANDROID_BUILD_TOOLS "30.0.3"
ENV ANDROID_TOOLS_REV "7583922_latest"

ENV ANDROID_HOME /opt/android-commandlinetools-linux
ENV ANDROID_SDK_HOME $ANDROID_HOME

ADD https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_TOOLS_REV}.zip /tmp/android-commandlinetools.zip

RUN mkdir $ANDROID_SDK_HOME && \
    unzip -qq /tmp/android-commandlinetools.zip -d $ANDROID_SDK_HOME && \
    rm -f android-sdk.zip

ENV PATH $PATH:$ANDROID_HOME/platform-tools/

RUN mkdir $ANDROID_SDK_HOME/.android && \
    echo 'count=0' > $ANDROID_SDK_HOME/.android/repositories.cfg

RUN echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME --update && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'tools' && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'platform-tools' && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'build-tools;'$ANDROID_BUILD_TOOLS && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'platforms;android-'$ANDROID_COMPILE_SDK && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'extras;android;m2repository' && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'extras;google;google_play_services' && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'extras;google;m2repository' && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2' && \
    echo y | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_SDK_HOME 'extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2' && \
    mkdir -p "$ANDROID_HOME/licenses" && \
    echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license" && \
    echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
