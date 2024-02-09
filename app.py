import flet
from flet import *
import requests
import datetime

api_key = '2646b503a2c500ca852dedfe7cea4f94'

_current = requests.get(f"https://api.openweathermap.org/data/2.5/onecall?lat=10.40&lon=-75.52&exclude=minutely,hourly,alerts&units=metric&appid={api_key}")


days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

def main(page: Page):
    page.horizontal_alignment='center'
    page.vertical_alignment='center'

    _c = Container(
        width=310,
        height=660,
        border_radius=35,
        bgcolor='black',
        padding=10,
        content=Stack(
            width=300,
            height=550,
            controls=[],
        )
    )

    page.add(_c)

if __name__ == "__main__":
    flet.app(target=main, assets_dir="assets")