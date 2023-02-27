import csv
import os
from pickle import FALSE, TRUE

def new_path(path1, path2):
    path3 = path1 + '/' + path2
    return path3

def get_ver(binary_name):
    binary_name_list = binary_name[0].split('-')
    version = binary_name_list[1]
    return version

def get_link(zephyr_ver, arch, board, sample, binary):
    link = r"https://github.com/Sidharth224/Binary-dataset-CVE-beta/tree/main/binaries/RTOS-specific-Dataset/Binaries-SDK-specific/"
    link = link + 'zephyr-' + zephyr_ver + '/' + arch + '/' + board + '/' + sample + '/' + binary
    return link

def get_vul_link(cve):
    cve_lower = cve.lower()
    vul_link = r"https://docs.zephyrproject.org/latest/security/vulnerabilities.html#"
    vul_link = vul_link + cve_lower
    return vul_link

def get_board_link(Board):
    if Board == r'DesignWare-EM-SDP':
        board_link = r'https://docs.zephyrproject.org/2.4.0/boards/arc/emsdp/doc/index.html'
    if Board == r'DesignWare-IoT-DK':
        board_link = r'https://docs.zephyrproject.org/2.4.0/boards/arc/iotdk/doc/index.html'
    if Board == r'ARM-Cortex-M3-Emulation-QEMU':
        board_link = r'https://docs.zephyrproject.org/2.4.0/boards/arm/qemu_cortex_m3/doc/index.html'
    if Board == r'Nordic-nRF5340-DK':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/arm/nrf5340_dk_nrf5340/doc/index.html'
    if Board == r'NXP-FRDM-K22F':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/arm/frdm_k22f/doc/index.html'
    if Board == r'ST-STM32F769I-Discovery':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/arm/stm32f769i_disco/doc/index.html'
    if Board == r'LiteX-VexRiscv':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/riscv/litex_vexriscv/doc/litex_vexriscv.html'
    if Board == r'SiFive-HiFive1':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/riscv/hifive1/doc/index.html'
    if Board == r'ACRN-UOS':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/x86/acrn/doc/index.html'
    if Board == r'MinnowBoard-Max':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/x86/minnowboard/doc/index.html'
    if Board == r'Up-Squared':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/x86/up_squared/doc/index.html'
    if Board == r'NXP-MIMXRT1064-EVK':
        board_link = r'https://docs.zephyrproject.org/2.2.0/boards/arm/mimxrt1064_evk/doc/index.html'
    return board_link

header = ['Zephyr Version', 'Architecture', 'Board name', 'Peripheral Sample', 'Binary Generated in Git', 'MCU Details']
path = r'/home/sidharth/Binary-dataset-CVE-beta/binaries/RTOS-specific-Dataset/Binaries-SDK-specific'
csv_path_empty = r'/home/sidharth/dataset-creation/zephyr-binaries/Binaries_empty.csv'
csv_path = r'/home/sidharth/dataset-creation/zephyr-binaries/Binaries.csv'

with open(csv_path_empty, 'w') as f:
    csv_writer = csv.writer(f)
    csv_writer.writerow(header)
    for sdk in os.listdir(path):
        sdk_path=new_path(path,sdk)
        os.chdir(sdk_path)
        for arch in os.listdir(sdk_path):
            arch_path=new_path(sdk_path,arch)
            os.chdir(arch_path)
            for board in os.listdir(arch_path):
                board_path=new_path(arch_path,board)
                os.chdir(board_path)
                for sample in os.listdir(board_path):
                    sample_path=new_path(board_path,sample)
                    os.chdir(sample_path)
                    binary = os.listdir(sample_path)
                    zephyr_ver = get_ver(binary)
                    data_link = get_link(zephyr_ver, arch, board, sample, binary[0])
                    board_link = get_board_link(board)
                    data_row = [zephyr_ver, arch, board, sample, data_link, board_link]
                    csv_writer.writerow(data_row)
f.close()

with open(csv_path_empty, newline='') as in_file:
    with open(csv_path, 'w', newline='') as out_file:
        writer = csv.writer(out_file)
        for row in csv.reader(in_file):
            if any(row):
                writer.writerow(row)

