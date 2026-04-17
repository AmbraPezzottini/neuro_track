# neuro_track

A data-driven pipeline to characterize global brain state dynamics 
from multichannel local field potential (LFP) recordings.

**Author:** Ambra Pezzottini, Mateo Barado
**Program:** Biomedical Engineering — Neuroengineering track  
**University:** University of Genoa

## Overview

This project develops a framework for mapping brain states using LFP signals,
inspired by state-mapping approaches used to study the wake–sleep cycle.

## Method

- LFP signals are segmented into sliding time windows and analyzed 
  in the frequency domain
- Two spectral power ratios sensitive to slow and low-frequency 
  oscillatory activity are extracted
- Dimensionality across channels is reduced via PCA; the first 
  principal component serves as a global descriptor of cortical activity
- The two first components define a 2D state space, where each point 
  represents an instantaneous brain state

## Group-level analysis

The framework extends to group-level analysis by aggregating multiple 
recordings, enabling direct comparison between natural sleep and 
ketamine-induced states.

## Goal

To provide a compact and continuous description of brain-state 
distributions and transitions across physiological and pharmacological 
conditions.
