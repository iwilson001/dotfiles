# Ollama notes, specifically w/ neovim

## Recommended Models
- From llama.vim
    - >16 GB ram, qwen 7b
    - <16 GB ram, qwen 3b
    - <8 GB ram, qwen 1.5b
- From chatgpt
   - qwen2.5-coder:3b -- laptop
   - qwen2.5-coder:7b -- normal
- Can always go more params if need more power

## Ollama commands
- `ollama list`
- `ollama ps`
- `ollama stop <model>`
    - ex: `ollama stop qwen2.5-coder:7b`
- `ollama pull <model>`
    - ex: `ollama pull qwen2.5-coder:3b`
- start ollama: `ollama serve`
- run model: `ollama run <model>`
    - ex: `ollama run qwen2.5-coder:3b`
