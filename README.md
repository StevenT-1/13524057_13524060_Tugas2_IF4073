# 13524057_13524060_Tugas1_IF4073
## Deskripsi Program

Program ini merupakan sebuah aplikasi MATLAB berbasis GUI untuk melakukan restorasi citra  melalui ranah frekuensi. Hal tersebut dilakukan dengan penapisan frekuensi dasar serta rekonstruksi citra yang mengalami degradasi berdasarkan model degradasi yang digunakan. Secara penuh, program ini mencakup image smoothing/blurring menggunakan low-pass filter, high-pass filtering, penapisan untuk menghasilkan citra yang lebih terang, image restoration untuk citra yang mengalami derau periodik, melalui bandreject filter dan notch reject filter, dan motion blur, melalui inverse filter dan wiener filter.


## Requirements

### MATLAB
- **Version:** R2026a or higher
- **Toolbox:** Image Processing Toolbox

## How to run

```bash
cd src
matlab -r "run('app1.mlapp')"
```