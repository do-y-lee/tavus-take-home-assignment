# Tavus Take-Home Assignment

## Overview

This project analyzes conversation session data to understand user behavior patterns, session durations, and daily active user (DAU) metrics. The analysis includes outlier detection, time-series visualization, and comparative analysis across different time periods.

**Jupyter Notebook:** [tavus-take-home-analysis.ipynb](./tavus-take-home-analysis.ipynb

## Environment Setup

### Prerequisites

- Python 3.11+
- PostgreSQL database
- Virtual environment support

### Installation

1. Clone the repository
2. Create and activate a virtual environment:

   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Database Configuration

The project connects to a local PostgreSQL database. Update the connection parameters in your scripts:

```python
engine = create_engine("postgresql://username:password@localhost:5432/database_name")
```
