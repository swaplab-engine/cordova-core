# SwapLab Engine: Cordova Core

![Status](https://img.shields.io/badge/status-active-success.svg)
![Security](https://img.shields.io/badge/security-hardened-blue.svg)
![Transparency](https://img.shields.io/badge/audit-public-orange.svg)

## 📖 Overview

This repository hosts the **Public Base Image** used by the [SwapLab Cordova Builder Service](https://swaplab.net).

At SwapLab, we believe in **Supply Chain Transparency**. While our proprietary build logic (`build-engine`) remains private to protect our intellectual property, the **environment** in which your code runs is open for public audit.

This image (`swaplab-engine/cordova-core`) serves as the foundation for our build pipeline. It contains the operating system, SDKs, build tools, and security scanners ensuring a stable and secure build environment for your hybrid applications.

---

## 🛠️ Technology Stack

This image is built on top of **Ubuntu 22.04 (Jammy)** and includes the following pre-configured environment:
---
> img tag: v2.1.0
---

| Component | Details | Purpose |
| :--- | :--- | :--- |
| **Android SDK** | Platform 36, Build Tools 36.0.0 | Compiling Android Apps |
| **Gradle** | Version 8.13 | Android Build System |
| **Node.js** | v22.x (LTS) | JavaScript Runtime |
| **Cordova CLI** | Latest (Global) | Core Cordova Framework |
| **Ruby & CocoaPods**| Latest | iOS Dependency Management |

---
* **Tag image:** [v2.1.0](https://github.com/swaplab-engine/cordova-core/releases/tag/v2.1.0)
* **Tag image:** [v2.0.1](https://github.com/swaplab-engine/cordova-core/releases/tag/v2.0.1)
* **Tag image:** [v2.0.0](https://github.com/swaplab-engine/cordova-core/releases/tag/v2.0.0)
* **Tag image:** [v1.0.0](https://github.com/swaplab-engine/cordova-core/releases/tag/v1.0.0)
---

## 🛡️ Security Philosophy: Freedom & Safety

At SwapLab, we believe developers should have the freedom to build without restrictions. **We do not rely on a manually managed "whitelist" of allowed plugins.** You are free to use *any* npm package or Cordova plugin required for your project.

To make this "Unlimited Ecosystem" safe, we employ a rigorous **Automated Security Gate** instead of manual reviews.

### Integrated Scanners
Every build runs through a real-time security gauntlet using industry-standard tools:
* **ClamAV:** Scans the entire filesystem for malware, viruses, and trojans.
* **Trivy:** Performs Software Composition Analysis (SCA) to detect known CVEs in your dependencies.
* **Semgrep:** Performs Static Application Security Testing (SAST) to catch insecure coding patterns.

---

## 🤝 Verify This Image

You can pull and inspect this image directly from the GitHub Container Registry to verify its contents match this documentation:

```bash
docker pull ghcr.io/swaplab-engine/cordova-core:latest
```

---

## 👨‍💻 About the Creator

SwapLab is built and maintained by **EMI (EMI-INDO)**, a dedicated developer in the Hybrid Mobile App ecosystem.

This service was built to solve the real-world build problems I faced while developing plugins and games.

* **Cordova Plugins:** I maintain various open-source [Cordova Plugins on GitHub](https://github.com/EMI-INDO?tab=repositories).
* **Game Assets:** Verified seller of [Construct 3 Addons](https://www.construct.net/en/game-assets/users/emiindo-378213).
* **Community:** Active member of the [Construct Community Forums](https://www.construct.net/en/forum).

---
<p align="center">
  Made with ❤️ by the <b>SwapLab Engineering</b>
</p>
