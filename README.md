# Lexical Semantic Change Detection (LSCD) for the Russian language by the DeepMistake team.

This repository contains code to reproduce the best results from the paper:

Nikolay Arefyev, Maksim Fedoseev, Vitaly Protasov, Daniil Homskiy, Adis Davletov, Alexander Panchenko. ["DeepMistake: Which Senses are Hard to Distinguish for a Word­in­Context Model"](http://www.dialog-21.ru/media/5235/arefyevnplusetal133.pdf) in Computational Linguistics and Intellectual Technologies:
Proceedings of the International Conference “Dialogue 2021”.

DeepMistake was 2nd best system in the [RuShiftEval-2021 competition](http://www.dialog-21.ru/media/5296/pivovarovalpluskutuzova151.pdf).

After the competition we improved the system and outperformed the winner of the competition (see the table below).

# Citation
If you use any part of the system, please, cite our paper above.

# Reproduction of the best results
## Installation
1. Clone repositories:
```shell script
git clone https://github.com/Daniil153/RuShiftEval
cd RuShiftEval
git clone https://github.com/davletov-aa/mcl-wic
```

2. Install requirements
    ```shell script
    pip install -r mcl-wic/requirements.txt
    ```
### The solution for the RuShiftEval-2021 shared task on LSCD.
1. Download [data](https://zenodo.org/record/4977798#.YMxeNCZRVH4). 
You can download data from the command line also:
```shell script
bash download_files.sh
```
2. Download models:
```shell script
bash download_models.sh 
```
3. To reproduce our best result:
```shell script
bash eval_best_post-eval_model.sh
```
For other results see the table below.

## Results
Results of the LSCD task are presented in the following table. To reproduce them, follow the instructions above to install the correct dependencies. 


<table>
    <thead>
        <tr>
            <th rowspan=1><b>Model</b></th>
            <th colspan=1><b>RuShiftEval avg</b></th>
            <th colspan=1><b>RuShiftEval1</b></th>
            <th colspan=1><b>RuShiftEval2</b></th>
            <th colspan=1><b>RuShiftEval3</b></th>
            <th rowspan=1><b>Script</b></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>first+concat on MCL<sup>en-acc</sup><sub>CE</sub> &rarr; RSS<sup>dev2-sentSpear</sup><sub>MSE</sub>, LinReg</td>
            <td>0.791</td>
            <td>0.798</td>
            <td>0.773</td>
            <td>0.803</td>
            <td>eval_best_eval_model.sh</td>
        </tr>
        <tr>
            <td>mean+dist_l1ndotn-hs0 on MCL<sup>nen-acc</sup><sub>CE</sub> &rarr; RSS<sup>dev2-sentSpear</sup><sub>MSE</sub>, Mean</td>
            <td>0.823</td>
            <td>0.825</td>
            <td>0.821</td>
            <td>0.823</td>
            <td>eval_2best_post-eval_model.sh</td>
        </tr>
        <tr>
            <td>mean+dist_l1ndotn-hs0 on MCL<sup>nen-acc</sup><sub>CE</sub> &rarr; RSS<sup>dev2-sentSpear</sup><sub>CE</sub>, Mean</td>
            <td>0.843</td>
            <td>0.846</td>
            <td>0.848</td>
            <td>0.836</td>
            <td>eval_best_post-eval_model.sh</td>
        </tr>
    </tbody>
</table>

