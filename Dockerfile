FROM openjdk:8-jdk
MAINTAINER Benoît HAGENBOURGER "benoit@hagenbourger.fr"

ENV ANDROID_COMPILE_SDK "29"
ENV ANDROID_BUILD_TOOLS "29.0.2"
ENV ANDROID_SDK_TOOLS_REV "4333796"

RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_REV}.zip && \
    mkdir /opt/android-sdk-linux && \
    unzip -qq android-sdk.zip -d /opt/android-sdk-linux && \
    rm -f android-sdk.zip

ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_HOME $ANDROID_HOME
ENV PATH $PATH:$ANDROID_HOME/platform-tools/

RUN mkdir $ANDROID_SDK_HOME/.android && \
    echo 'count=0' > $ANDROID_SDK_HOME/.android/repositories.cfg

RUN echo y | $ANDROID_HOME/tools/bin/sdkmanager --update && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'tools' && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'platform-tools' && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'build-tools;'$ANDROID_BUILD_TOOLS && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'platforms;android-'$ANDROID_COMPILE_SDK && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'extras;android;m2repository' && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'extras;google;google_play_services' && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'extras;google;m2repository' && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2' && \
    echo y | $ANDROID_HOME/tools/bin/sdkmanager 'extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2' && \
    mkdir -p "$ANDROID_HOME/licenses" && \
    echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license" && \
    echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
