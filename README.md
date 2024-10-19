# Isogeometric Analysis Projects

This repository includes projects developed as part of a course on Isogeometric Analysis (IGA). IGA is a computational approach that integrates finite element analysis (FEA) with the flexibility of NURBS (Non-Uniform Rational B-Splines) or B-splines, which are widely used in Computer-Aided Design (CAD). The projects presented here focus on generating and evaluating spline-based geometries for application in engineering simulations.

## Table of Contents
- [Overview](#overview)
- [Projects](#projects)
- [Installation](#installation)
- [Usage](#usage)

## Overview

Isogeometric Analysis (IGA) bridges the gap between CAD and Finite Element Analysis by employing the same spline-based representations for both geometry modeling and numerical analysis. This approach offers superior accuracy in simulations, especially for problems requiring exact geometric descriptions, such as fluid-structure interaction or structural optimization. The repository provides MATLAB implementations for generating and evaluating B-splines and NURBS basis functions, fundamental to many IGA applications.

## Projects

1. **B-Spline Basis Function Generation**:
    - This project implements the algorithms necessary to generate B-spline basis functions. The functions are the foundation of IGA, offering the capability to represent complex geometries with high continuity, which enhances simulation accuracy. The methods here are useful for evaluating and testing spline representations in engineering simulations.

2. **NURBS Evaluation and Surface Generation**:
    - The NURBS-based project explores the evaluation and plotting of surfaces described by NURBS functions. NURBS surfaces are highly flexible and can represent exact geometries such as circles or ellipses, making them ideal for precision engineering tasks. This implementation includes evaluation algorithms and visualization techniques that help in understanding and validating NURBS-based geometries.

## Installation

To run the code, clone the repository:
```bash
git clone https://github.com/wasumek/Isogeometric-Analysis.git
```

## Usage

These MATLAB scripts are designed for generating, evaluating, and visualizing B-spline and NURBS geometries. The code can be used to test different spline configurations and assess their effectiveness for specific engineering problems. Run the provided scripts in MATLAB to compute spline basis functions and visualize their effects on the geometry.
