# ===================================================================
# SWAPLAB ENGINE: CORDOVA CORE (PUBLIC BASE IMAGE)
# Repo: swaplab-engine/cordova-core
# Description: Public base image providing a transparent, secure, and 
# pre-configured environment for Cordova Android & iOS builds.
# ===================================================================
FROM ubuntu:22.04 AS cordova-core

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV COCOAPODS_ALLOW_ROOT=true

# -------------------------------------------------------------------
# 1. System Dependencies Installation (Including Ruby)
# -------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    openjdk-21-jdk \
    jq \
    python3 \
    python3-pip \
    unzip \
    curl \
    clamav \
    clamav-daemon \
    zip \
    git \
    locales \
    wget \
    gnupg \
    lsb-release \
    apt-transport-https \
    ruby-full \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

RUN freshclam

# ===================================================================
# 🛡️ SECURITY TRANSPARENCY POLICY
# ===================================================================
# At SwapLab, we prioritize supply chain security. Every build process 
# is scanned in real-time using the tools installed below.
#
# ENFORCEMENT POLICY:
# If ClamAV (Virus), Trivy (Dependency), or Semgrep (Code) detects any
# CRITICAL THREATS, the build process will be IMMEDIATELY ABORTED.
#
# PUBLIC TRANSPARENCY:
# To ensure accountability, details of the threats causing the build failure 
# are logged publicly (isolated & anonymized) on our Security Dashboard. 
# Customers can verify our system integrity here:
#
# 📊 Dashboard: https://security-stats.swaplab.net
# ===================================================================

# -------------------------------------------------------------------
# 2. Security Tools Installation
# -------------------------------------------------------------------
# Trivy (SCA - Software Composition Analysis)
# Used to scan for vulnerabilities in OS packages and dependencies.
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor -o /usr/share/keyrings/trivy.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" > /etc/apt/sources.list.d/trivy.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends trivy && \
    rm -rf /var/lib/apt/lists/*

# Semgrep (SAST - Static Application Security Testing)
# Used to scan for insecure code patterns and potential exploits.
RUN pip3 install semgrep

# -------------------------------------------------------------------
# 3. Android SDK & Build Tools Installation
# -------------------------------------------------------------------
ARG ANDROID_SDK_VERSION=11076708
ARG ANDROID_BUILD_TOOLS_VERSION=35.0.0
ARG ANDROID_PLATFORM_VERSION=35
ENV ANDROID_HOME=/usr/lib/android-sdk
ENV PATH=$PATH:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools

RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    curl -o android_tools.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_VERSION}_latest.zip && \
    unzip -d ${ANDROID_HOME}/cmdline-tools android_tools.zip && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    rm android_tools.zip

RUN yes | sdkmanager --licenses && \
    sdkmanager --install "platform-tools" "platforms;android-${ANDROID_PLATFORM_VERSION}" "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

# -------------------------------------------------------------------
# 4. Gradle Installation
# -------------------------------------------------------------------
ARG GRADLE_VERSION=8.11.1
ENV GRADLE_HOME=/opt/gradle/gradle-${GRADLE_VERSION}
RUN curl -o gradle.zip -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip -d /opt/gradle gradle.zip && \
    rm gradle.zip

# -------------------------------------------------------------------
# 5. Node.js, Cordova CLI, and iOS Support
# -------------------------------------------------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Cordova CLI
RUN npm install -g cordova

# CocoaPods (Required for iOS builds)
RUN gem install cocoapods

# Final Environment Variables Setup
ENV GRADLE_USER_HOME=/github/workspace/.gradle
ENV PATH=${PATH}:${GRADLE_HOME}/bin

CMD ["cordova", "--version"]
