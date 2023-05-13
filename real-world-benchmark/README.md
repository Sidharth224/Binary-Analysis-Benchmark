# Linux based Firmwares
| Vendor  | Category | Type | Model | Binary | Source Code |
|---------|----------|------|-------|--------|-------------|
| D-Link  | Smart Home | Camera | DCS-800L | https://d2okd4tdjucp2n.cloudfront.net/DCS-800L/DCS-800L_A1_v1.06.10.zip | https://dlink-gpl.s3.amazonaws.com/GPL1900119/DCS-800L_A1_GPL10610.tar.gz |
| D-Link | Smart Home | Router | DIR-880L | https://d2okd4tdjucp2n.cloudfront.net/DIR-880L/DIR-880L_A1_FW_1.07.zip | https://dlink-gpl.s3.amazonaws.com/GPL1900168/DIR880A1_GPL108WWb06.tar.gz |
| D-Link | Smart Home |	Storage	| DNS-340L | https://d2okd4tdjucp2n.cloudfront.net/DNS-340L/DLINK_DNS-340L_1.08b01(1.01.0502.2018).zip | https://dlink-gpl.s3.amazonaws.com/GPL1600307/DNS340L_Ax_GPL10505.tar.gz |
| D-Link | Smart Home | Storage | DNR-322L | https://d2okd4tdjucp2n.cloudfront.net/DNR-322LB/DNR-322L_V3_02_15.zip | https://dlink-gpl.s3.amazonaws.com/GPL1600325/DNR-322L_B1_FW_V3.01_GPL_20160714.tar.gz |
| PineTIme | Wearable | Smart Watch | n/a |	n/a	| https://github.com/joaquimorg/PinetimeLite |
| NETGEAR | Smart Home | WiFi router | CAX30S | https://www.downloads.netgear.com/files/GDC/CAX30/CAX30-V1.4.11.2.zip | https://www.downloads.netgear.com/files/GPL/CAX30_v1.4.9.4_gpl.zip |
| NETGEAR | Smart Home | WiFi router | D6000 - AC750 | https://www.downloads.netgear.com/files/GDC/D6000/D6000_V1.0.0.80_1.0.1.zip |https://www.downloads.netgear.com/files/GPL/D6000_v1.0.0.80_GPL-20200806.tar.gz |
| NETGEAR | Smart Home | WiFi router | CAX80 | https://www.downloads.netgear.com/files/GDC/CAX80/CAX80-V2.1.5.2.zip | https://www.downloads.netgear.com/files/GPL/OpenBFC_20.1_RDKM_3party.tar.gz |
| Tasmota - Bluetooth | Smart Home | ESP Firmware | n/a | n/a |	https://github.com/arendst/Tasmota |
| Tasmota - Zigbee | Smart Home | ESP Firmware | n/a | n/a |	https://github.com/arendst/Tasmota |
| Tasmota - Sensor | Smart Home | ESP Firmware | n/a | n/a |	https://github.com/arendst/Tasmota |
| Opto22 | ICS Equipment | PLC | GRV-R7-MM1001-10 | https://www.opto22.com/support/resources-tools/downloads/grv-r7-mm1001-10-firmware | https://github.com/Opto22/node-red-contrib-groov-io | https://github.com/Parrot-Developers/olympe
| Siemens | ICS Equipment | LOGO | LOGO V8 | https://support.industry.siemens.com/cs/document/109780764/product-information-on-the-firmware-update-for-logo!-8-for-security-vulnerability-cve-2020-7593-?dti=0&pnid=13613&lc=en-WW | n/a |
| TP-Link | Smart Home | Smart Plug | Deco XE75 Pro | https://www.tp-link.com/us/support/download/deco-xe75-pro/#Firmware | https://www.tp-link.com/us/support/gpl-code/ |
| TP-Link | Smart Home | WiFi router | Archer A7 | https://www.tp-link.com/us/support/download/archer-a7/#Firmware | https://www.tp-link.com/us/support/gpl-code/ |
| TP-Link | Networking | SDN Controller | Omada - OC200 | https://www.tp-link.com/us/support/download/oc200/#Firmware | https://www.tp-link.com/us/support/gpl-code/ |
| TP-Link | Networking | L2 Managed Switches | TL-SG3452XP | https://www.tp-link.com/us/support/download/tl-sg3452xp/#Firmware | https://www.tp-link.com/us/support/gpl-code/ |
| Yi | Smart Camera | Dash Cam | CK11H | https://www.yitechnology.com/firmware | n/a |
| Yi | Smart Camera | Mirrorless Cam | Yi-M1 | https://www.yitechnology.com/firmware/ | n/a |

# Bare-metal firmwares created from research papers
| Git Repo |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Research&nbsp;Paper&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Authors | Firmware Type | OS | SDK | Hardware used |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|
|----------|-----------------------------------|---------|---------------|----|-----|---------------|---------------------------|
| https://github.com/OSUSecLab/FirmXRay/tree/master/dataset | [FirmXRay: Detecting Bluetooth Link Layer Vulnerabilities From Bare-Metal Firmware](http://web.cse.ohio-state.edu/~wen.423/papers/ccs20_FirmXRay) | Haohuang Wen, Zhiqiang Lin and Yinqian Zhang | BLE Bluetooth Low energy based firmwares | n/a (bare-metal) |[BLE-STACK](https://www.ti.com/tool/BLE-STACK) (Ti) and [SoftDevice API](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fstruct_nrf52%2Fstruct%2Fnrf52_softdevices.html&cp=4_5) (Nordic) | [nRF52-DK](https://www.nordicsemi.com/Products/Development-hardware/nrf52-dk) for Nordic bases firmwares. [SimpleLink Bluetooth Low Energy family of ARM Cortex-M3](https://www.ti.com/wireless-connectivity/bluetooth/products.html) are the boards supported by BLE STACK | n/a |
| https://github.com/pwnforce/uSBS/tree/master/Ground-truth%20Benchmark/fw | [μSBS: Static Binary Sanitization of Bare-metal Embedded Devices for Fault Observability](https://www.usenix.org/conference/raid2020/presentation/salehi) | Majid Salehi, Danny Hughes and Bruno Crispo |  Firmwares the access peripheral TCP/UDP | n/a (bare-metal) | [STM32Cube Ethernet HAL and LwIP](https://www.st.com/resource/en/user_manual/um1713-developing-applications-on-stm32cube-with-lwip-tcpip-stack-stmicroelectronics.pdf) | [STM32-Nucleo F401RE](https://www.st.com/en/evaluation-tools/nucleo-f401re.html), [STM32F479I-Eval](https://www.st.com/en/microcontrollers-microprocessors/stm32f469-479.html), [STM32F4Discovery](https://www.st.com/en/evaluation-tools/stm32f4discovery.html), [STM32-Nucleo L152RE](https://www.st.com/en/evaluation-tools/nucleo-l152re.html) | n/a |
| https://github.com/RiS3-Lab/p2im-real_firmware | [P2IM: Scalable and Hardware-independent Firmware Testing via Automatic Peripheral Interface Modeling](https://www.usenix.org/system/files/sec20-feng.pdf) | Bo Feng, Alejandro Mera, Long Lu | Robot | None (bare-metal) | DIY | [STM32F103RB](https://stm32-base.org/boards/) | n/a |			
|  -  |  -  |  -  | PLC	| Arduino | DIY	| [STM32F429ZI](https://stm32-base.org/boards/) | n/a |
|  -  |  -  |  -  | Gateway |	Arduino | DIY | [STM32F103RB](https://stm32-base.org/boards/) | n/a |
|  -  |  -  |  -  | Drone | None (bare-metal) | DIY | [STM32F103RB](https://stm32-base.org/boards/) | n/a |
|  -  |  -  |  -  | CNC | None (bare-metal) | DIY | [STM32F429ZI](https://stm32-base.org/boards/) | n/a | 
|  -  |  -  |  -  | Reflow Oven | Arduino | DIY | [STM32F103RB](https://stm32-base.org/boards/) | n/a | 
|  -  |  -  |  -  | Console | RIOT | DIY | [MK64FN1M0VLL12](https://www.nxp.com/part/MK64FN1M0VLL12#/) | n/a | 
|  -  |  -  |  -  | Steering Control | Arduino	| DIY | [SAM3X8E](https://www.microchip.com/en-us/product/ATSAM3X8E) | n/a | 
|  -  |  -  |  -  | Soldering Iron | FreeRTOS | DIY | [STM32F103RB](https://stm32-base.org/boards/) | n/a | 
|  -  |  -  |  -  | Heat Press | Arduino | DIY | [STM32F103RB](https://stm32-base.org/boards/) | n/a | 
| https://github.com/ucsb-seclab/pretender | [Toward the Analysis of Embedded Firmware through Automated Re-hosting](https://www.usenix.org/system/files/raid2019-gustafson.pdf) | Eric Gustafson, Marius Muench, et al. | Firmwares that use peripherals Radio, UART, RF-lock, Thermostat and I2C | Mbed OS 5 |DIY | MAX32600, STM32-Nucleo_F072RB and STM-Nucleo_L152RE | n/a |
| https://github.com/panda-re/lava/tree/master | [LAVA: Large-scale automated vulnerability addition](https://ieeexplore.ieee.org/document/7546498) | Brendan Dolan-Gavitt, Patrick Hulin et al. | n/a | n/a | DIY | n/a | LAVA is tool used to inject bugs into a program, some of the example programs with bugs injected by LAVA has been included in the dataset.  The packages used by the tool are obsolete right now. But it is worth reading it, the paper [What You Corrupt Is Not What You Crash: Challenges in Fuzzing Embedded Devices](https://s3.eurecom.fr/docs/ndss18_muench.pdf) explains how to use lava to inject bugs into ur code |
| https://github.com/seemoo-lab/polypyus/tree/master | [Polypyus – The Firmware Historian](https://www.ndss-symposium.org/wp-content/uploads/bar2021_23004_paper.pdf) | Jan Friebertshauser, Florian Kosterhon, Jiska Classen and Matthias Hollick | BCM20702A1	| None (bare-metal)	| DIY | ARM7TDMI-S | Asus USB Dongle |
|  -  |  -  |  -  | BCM2070B0	| None (bare-metal)	| DIY | Cortex M3 | MacBook 2011, Thinkpad T420 |
|  -  |  -  |  -  | BCM4335C0	| None (bare-metal)	| DIY | Cortex M3 | Google Nexus 5 |
|  -  |  -  |  -  | BCM43430A1	| None (bare-metal)	| DIY | Cortex M3 | Raspberry Pi 3/Zero W |
|  -  |  -  |  -  | BCM4345B0	| None (bare-metal)	| DIY | Cortex M3 | iPhone 6 |
|  -  |  -  |  -  | BCM4345C0	| None (bare-metal)	| DIY | Cortex M3 | Raspberry Pi 3+/4 |
|  -  |  -  |  -  | BCM4347B0	| None (bare-metal)	| DIY | Cortex M4 | Samsung Galaxy S8 |
|  -  |  -  |  -  | BCM4375B1	| None (bare-metal)	| DIY | Cortex M3 | iPhone 8/X/XR |
|  -  |  -  |  -  | BCM4378B1	| None (bare-metal)	| DIY | Cortex M4 | iPhone 11/SE2 |
| https://github.com/fuzzware-fuzzer/fuzzware-experiments | [Fuzzware: Using Precise MMIO Modeling for Effective Firmware Fuzzing](https://www.usenix.org/system/files/sec22summer_scharnowski.pdf) | Tobias Scharnowski, Nils Bars, Moritz Schloegel, Eric Gustafson, et al. | Password recovery | None (bare-metal) | DIY | ARCH_PRO, NXP_LPC1549, STM32-NUCLEO_F103RB, EFM32GG_STK3700, NXP_LPC1768, STM32-NUCLEO_F207ZG, UBLOX_C027, EFM32LG_STK3600, MOTE_L152RC, STM32-NUCLEO_L152RE | n/a |

# Other - Bare-metal firmwares collected from random open source projects 
| Git Repo | Source |   Firmware Type  | OS | Hardware used | Comments |
|----------|--------|------------------|----|---------------|----------|
| https://github.com/cpq/bare-metal-programming-guide/tree/main | https://awesomeopensource.com/search?q=bare-metal | LED_blinky, UART, Webserver, minimal-RAM-access, systick | None (bare-metal) | STM32 Nucleo-F429ZI, TI EK-TM4C1294XL, TI EK-TM4C1294XL | Firmware from this project are in [Other/1](https://github.com/Sidharth224/Security-Firmware-Benchmark/tree/main/real-world-benchmark/Other/1) |	
| https://github.com/allexoll/BBB-BareMetal/tree/master | https://awesomeopensource.com/search?q=bare-metal | Bootloader, GPIO, I2C, LED, Low_level_init, UART, USB_Bootloader, stdlib | None (bare-metal) | STM32 Nucleo-F429ZI, TI EK-TM4C1294XL, TI EK-TM4C1294XL | Firmware from this project are in [Other/2](https://github.com/Sidharth224/Security-Firmware-Benchmark/tree/main/real-world-benchmark/Other/2) |	
					
