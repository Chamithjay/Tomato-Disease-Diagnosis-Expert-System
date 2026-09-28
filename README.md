# Tomato Plant Disease Expert System

A rule-based expert system developed using **SWI-Prolog** to identify possible diseases of tomato plants based on observed symptoms.

## Project Overview

The system allows a user to select symptoms observed on a tomato plant. The inference engine compares the selected symptoms with rules in the knowledge base and displays the possible matching diseases.

### Main Components

- **User Interface (`user_interface.pl`)** – Displays symptoms, accepts user input, and shows results.
- **Knowledge Base (`knowledge_base.pl`)** – Contains disease information and symptom-based rules.
- **Inference Engine (`inference_engine.pl`)** – Evaluates the rules against the selected symptoms.
- **Main File (`main.pl`)** – Loads all system components.

## Diseases Covered

The system currently covers:

- Damping-off
- Early Blight
- Late Blight
- Target Spot
- Powdery Mildew
- Anthracnose
- Septoria Leaf Spot
- Collar / Root Rot
- Bacterial Wilt
- Bacterial Canker
- Tomato Yellow Leaf Curl Virus (TYLCV)
- Curly Top Virus
- Tomato Spotted Wilt Virus (TSWV)
- Cucumber Mosaic Virus (CMV)

## Knowledge Source

The disease and symptom information used in the knowledge base is based on the **Horticultural Crops Research and Development Institute (HORDI), Department of Agriculture, Sri Lanka**.

Source:
https://doa.gov.lk/hordi-crop-tomato/

The Prolog rules represent the documented symptom information from this source.

## Requirements

- SWI-Prolog

Download: https://www.swi-prolog.org/

## How to Run

1. Open **SWI-Prolog**.
2. Navigate to the project directory:

```prolog
cd('path/to/Tomato-Plant-Disease-Expert-System').
```

3. Load the system:

```prolog
[main].
```

4. Start the expert system:

```prolog
start.
```

5. Select the observed symptoms by entering their numbers separated by spaces.

Example:

```text
1 2
```

The system will then display the possible matching disease(s).

## Project Structure

```text
Tomato-Plant-Disease-Expert-System/
├── main.pl
├── knowledge_base.pl
├── inference_engine.pl
├── user_interface.pl
└── README.md
```

## Note

The system provides **possible diagnoses based on the selected symptoms** and is intended for academic and educational purposes. It does not replace professional agricultural diagnosis.
