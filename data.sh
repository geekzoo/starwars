#!/bin/bash
logo='H4sIAMYJqFsCA31Uy27EIAy88xUoqOqB4NzpZhWp1956RUrUXiv1B/zx9YsQstl6k4ANHsaDtc6fbbIRuqEz6Gd1pzsnTcMyTn6Dp+ner2Y6tYC7SBBa2xUbWZ+8ZSNPffHoeTgjvbXpJRYdfpdkSlcIjyilPLDKXSVbgrWvDqWuiUakGH/ppadwGF2/WXnd5nH9hnGF3zl99XKt9TnI5M9yQeVF9j6Xubwtt2E4S0VEJl+4xKNSIBLuxAyHea3frz/Lzed7WR4FQzsWT2KxitIRSkrCBdY5EZ+ybMN1PxTSq5hmB7VIRnc80G9f//Tkg+OqG55nXHf2eXVnEWwPWNd4gJR8Sik3Iw/slupuZ8gQarsB6OY69sbRYSBkADgiOfJhHH9DCDNLCpoOZjnHiBjoiQFjjA8HEDETZd1eBvAtMbcZQTAGG0H0BAmUgtbzWlZ6BdAqd4TcsISQoXHENuRY0dgSFUYwjHCklHeo/WzCosqQaNEKR6LEdUlYB/k7AiHEe07C1pCcHIRZNISIuSLxgsK5SideglViUkcIUTQjL7BjQUUTMFaTszDma4sVixKz4OxsED8+FSsKmnsK0Bxig9WUyEI/m5KzBLtqp50Cet2x6a182lVpW+wN0oCbNc0MJsc9PagwHVjMdg7X2wHxx7k/GRy2R6sGAAA=' #LOGO
intro='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'
cont='H4sIAM+XY1wAA1NwqizKz1MISq1Q8E0sKclILS9WiFWIVrAwMNQ1NTTQNTEwNgELBOcH5+SX67mnpmZXObjnJmbm6Dnn5ypwAQAb2zQ9QQAAAA=='
