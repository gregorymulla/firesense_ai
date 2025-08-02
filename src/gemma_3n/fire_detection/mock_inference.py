"""Mock inference for fire detection when GPU is not available."""

import random
import time
from typing import Any

from .model import FireDescription


def mock_setup_model() -> tuple[Any, Any]:
    """Mock model setup that returns dummy objects."""
    print("Loading mock model (GPU not available)...")
    print("Using random inference for demonstration purposes.")
    
    # Return dummy objects that won't be used
    return None, None


def mock_gemma_fire_inference(
    model: Any,
    tokenizer: Any,
    messages: list[dict[str, Any]],
    max_new_tokens: int = 256,
) -> FireDescription:
    """Generate mock fire detection results with random values."""
    
    # Simulate inference delay (much faster than real inference)
    time.sleep(random.uniform(0.1, 0.3))
    
    # Generate random results with some bias towards no fire
    # 60% chance of no flame, 40% chance of flame
    has_flame = random.random() < 0.4
    
    # If there's flame, 25% chance it's out of control
    has_out_of_control_fire = has_flame and random.random() < 0.25
    
    return FireDescription(
        has_flame=has_flame,
        has_out_of_control_fire=has_out_of_control_fire
    )