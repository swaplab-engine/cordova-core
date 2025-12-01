# SwapLab Engine: Cordova Core

![Status](https://img.shields.io/badge/status-active-success.svg)
![Security](https://img.shields.io/badge/security-hardened-blue.svg)
![Transparency](https://img.shields.io/badge/audit-public-orange.svg)

## 📖 Overview

This repository hosts the **Public Base Image** used by the [SwapLab Cordova Builder Service](https://cordova.swaplab.net).

At SwapLab, we believe in **Supply Chain Transparency**. While our proprietary build logic (`build-engine`) remains private to protect our intellectual property, the **environment** in which your code runs is open for public audit.

This image (`swaplab-engine/cordova-core`) serves as the foundation for our build pipeline. It contains the operating system, SDKs, build tools, and security scanners ensuring a stable and secure build environment for your hybrid applications.

---

## 🛠️ Technology Stack

This image is built on top of **Ubuntu 22.04 (Jammy)** and includes the following pre-configured environment:

| Component | Details | Purpose |
| :--- | :--- | :--- |
| **Android SDK** | Platform 35, Build Tools 35.0.0 | Compiling Android Apps |
| **Gradle** | Version 8.11.1 | Android Build System |
| **Node.js** | v20.x (LTS) | JavaScript Runtime |
| **Cordova CLI** | Latest (Global) | Core Cordova Framework |
| **Ruby & CocoaPods**| Latest | iOS Dependency Management |

---

## 🛡️ Security Philosophy: Freedom & Safety

At SwapLab, we believe developers should have the freedom to build without restrictions. **We do not rely on a manually managed "whitelist" of allowed plugins.** You are free to use *any* npm package or Cordova plugin required for your project.

To make this "Unlimited Ecosystem" safe, we employ a rigorous **Automated Security Gate** instead of manual reviews.

### 1. Integrated Scanners
Every build runs through a real-time security gauntlet using industry-standard tools:
* **ClamAV:** Scans the entire filesystem for malware, viruses, and trojans.
* **Trivy:** Performs Software Composition Analysis (SCA) to detect known CVEs in your dependencies.
* **Semgrep:** Performs Static Application Security Testing (SAST) to catch insecure coding patterns.

### 2. Enforcement Policy
If any of these scanners detect a **CRITICAL** threat, the build process is **IMMEDIATELY ABORTED**. This protects your project, your users, and our infrastructure.

### 3. Public Accountability
To ensure transparency, the specific reason for any security-related failure is logged publicly (anonymized) on our Security Dashboard.
📊 **Live Dashboard:** [security-stats.swaplab.net](https://security-stats.swaplab.net)

---

### ⚠️ Important Disclaimer: Shared Responsibility

While our Integrated Scanners provide a robust layer of defense, **no automated system is 100% accurate**. Automated tools may occasionally miss obfuscated threats or zero-day vulnerabilities (False Negatives).

Therefore, security is a shared responsibility:
* **Our Role:** We provide a hardened, scanned environment and block known threats.
* **Your Role:** You must ensure that every dependency, plugin, or library you include in your `package.json` or `config.xml` comes from a **trusted and verified source**.

**SwapLab does not audit the internal code of 3rd-party plugins you choose to install.** Please exercise due diligence when selecting community-maintained packages.

---

## 🔗 Legal & Governance

By using SwapLab services and this build environment, you agree to our policies. Please review the documents below for detailed information regarding data handling, repository access, and usage terms.

* **📄 Privacy Policy** [Read Privacy Policy](https://swaplab.net/privacy-policy/privacy-policy.html)
* **⚖️ Terms and Conditions** [Read Terms & Conditions](https://swaplab.net/privacy-policy/terms-and-conditions.html)
* **🔐 Repository Permissions** [View Repository Permissions Policy](https://swaplab.net/privacy-policy/repository-permissions.html)

---

## 🤝 Verify This Image

You can pull and inspect this image directly from the GitHub Container Registry to verify its contents match this documentation:

```bash
docker pull ghcr.io/swaplab-engine/cordova-core:latest
```

---


## 📄 License & Terms of Use

**The Base Environment** (Dockerfile configurations, OS setup, SDK installation) is provided under the **MIT License**, allowing for transparency and auditability.

**The Build Engine Binary** (`build-engine`) contained within the final distributed image is **Proprietary Software** owned by SwapLab.

### ⛔ No Reverse Engineering
By pulling and using these images, you agree to the [SwapLab Terms & Conditions](https://swaplab.net/privacy-policy/terms-and-conditions.html).
**Reverse engineering, decompiling, or disassembling the proprietary build executables is strictly prohibited.**



## 👨‍💻 About the Creator

SwapLab is built and maintained by **EMI (EMI-INDO)**, a dedicated developer in the Hybrid Mobile App ecosystem.

This service was built to solve the real-world build problems I faced while developing plugins and games.

* **Cordova Plugins:** I maintain various open-source [Cordova Plugins on GitHub](https://github.com/EMI-INDO?tab=repositories).
* **Game Assets:** Verified seller of [Construct 3 Addons](https://www.construct.net/en/game-assets/users/emiindo-378213).
* **Community:** Active member of the [Construct Community Forums](https://www.construct.net/en/forum).




---
<p align="center">
  Made with ❤️ by the <b>SwapLab Engineering Team</b>
</p>
