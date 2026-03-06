

<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
   <!-- Add logo here in the future :) -->
   <h3 align="center">Anydeck</h3>
   <p align="center">
      A Raspberry Pi-based DJ system that mimics the feel of professional all-in-one DJ controllers (e.g., XDJ-XZ) using Mixxx and a Pioneer DDJ-FLX4.
      <br />
      <br />
      <a href="https://github.com/jellyspec/anydeck/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
      &middot;
      <a href="https://github.com/jellyspec/anydeck/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
   </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
   <summary>Table of Contents</summary>
   <ol>
      <li>
         <a href="#about-the-project">About The Project</a>
         <ul>
            <li><a href="#built-with">Built With</a></li>
         </ul>
      </li>
      <li>
         <a href="#getting-started">Getting Started</a>
         <ul>
            <li><a href="#prerequisites">Prerequisites</a></li>
            <li><a href="#installation">Installation</a></li>
         </ul>
      </li>
      <li><a href="#usage">Usage</a></li>
      <li><a href="#roadmap">Roadmap</a></li>
      <li><a href="#contributing">Contributing</a></li>
      <li><a href="#license">License</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#acknowledgments">Acknowledgments</a></li>
   </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

A Raspberry Pi-based DJ system that mimics the feel of professional all-in-one DJ controllers (e.g., XDJ-XZ) using Mixxx and a Pioneer DDJ-FLX4. Anydeck transforms a Raspberry Pi into a standalone DJ setup with custom MIDI mapping, themed interface, and optimized OS configuration.

### Features

- **Standalone DJ system**: Use a Raspberry Pi with Mixxx and a DDJ-FLX4 controller.
- **Custom MIDI mapping**: Optimized for DDJ-FLX4, based on DDJ-400 mapping.
- **Pioneered skin**: Pioneer-inspired Mixxx theme for small screens.
- **Automated setup**: Scripts for installing all dependencies and configuring the system.
- **Hardware integration**: USB automount, GPIO shutdown button, and sound configuration for DDJ-FLX4 audio.
- **Open hardware designs**: Circuit files for custom hardware extensions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

- Raspberry Pi OS
- Mixxx DJ software
- Bash scripts
- Open-source hardware designs

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

- Raspberry Pi (tested with Raspberry Pi OS)
- Pioneer DDJ-FLX4 controller
- MicroSD card (16GB+ recommended)
- HDMI display, mouse, keyboard
- Internet connection

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Installation

1. **Flash Raspberry Pi OS**  
    Download and install Raspberry Pi OS (Lite or Desktop) on your SD card.
2. **Clone the repository**  
    ```sh
    git clone https://github.com/jellyspec/anydeck.git
    cd anydeck/scripts
    ```
3. **Run the setup script as root**  
    ```sh
    sudo ./setup.sh
    ```
    - Installs Mixxx, Openbox, deskflow, uhubctl, pi-usb-automount, and disables unnecessary services.
    - Configures autologin, links custom configs from `home/`, and sets up GPIO17 as shutdown.
4. **Connect DDJ-FLX4 and reboot**  
    - The controller will be recognized automatically.
    - Mixxx will start with the custom skin and mapping.

> Note: if you want to change the scale of your screen use this command: `wlr-randr --output HDMI-A-1 --scale 0.65

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

- Mixxx launches automatically on boot.
- The Pioneered skin provides a familiar Pioneer-style interface.
- MIDI mapping for DDJ-FLX4 is pre-installed.
- Sound configuration routes master and headphones to the controller.
- USB drives are automounted for easy music library access.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [x] Initial setup script
- [x] Custom Pioneer like skin
- [x] MIDI mapping
- [x] Hardware integration (shutdown, automount)
- [ ] Extended documentation
- [ ] Additional controller support
- [ ] Automated tests

See the [open issues](https://github.com/jellyspec/anydeck/issues) for a full list of planned features and known issues.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are welcome! Fork the project, create a feature branch, and open a pull request.

1. Fork the project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Mixxx skin and scripts: GPLv3  
Other content: See `LICENSE`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Project Owner: jellyspec  
Project Link: [https://github.com/jellyspec/anydeck](https://github.com/jellyspec/anydeck)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

- [Mixx DJ software](https://github.com/mixxxdj/mixxx)
- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
- [Malven's Grid Cheatsheet](https://grid.malven.co/)
- [Img Shields](https://shields.io)
- [GitHub Pages](https://pages.github.com)
- [Font Awesome](https://fontawesome.com)
- [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/jellyspec/anydeck.svg?style=for-the-badge
[contributors-url]: https://github.com/jellyspec/anydeck/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jellyspec/anydeck.svg?style=for-the-badge
[forks-url]: https://github.com/jellyspec/anydeck/network/members
[stars-shield]: https://img.shields.io/github/stars/jellyspec/anydeck.svg?style=for-the-badge
[stars-url]: https://github.com/jellyspec/anydeck/stargazers
[issues-shield]: https://img.shields.io/github/issues/jellyspec/anydeck.svg?style=for-the-badge
[issues-url]: https://github.com/jellyspec/anydeck/issues
[license-shield]: https://img.shields.io/github/license/jellyspec/anydeck.svg?style=for-the-badge
[license-url]: https://github.com/jellyspec/anydeck/blob/main/LICENSE