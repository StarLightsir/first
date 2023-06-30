import Const from '../constants/CommonContent'
import router from '@ohos.router'

@Entry
@Component
struct LoadingPage {
  @State progVal:number = 50
  @State progColorVal: number = 50
  private time:number

  build() {
    Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceEvenly,alignItems:ItemAlign.Center})
    {
      Text(router.getParams()['acoParms'] + '欢迎登陆云课堂').fontSize(20).fontColor(0xd8bfd8)
      Progress({
        value:this.progVal,total:150 , type:ProgressType.ScaleRing})
        .color(Color.Black).value(this.progColorVal).width(150)
        .style({ strokeWidth:30,scaleCount:30,scaleWidth:10})
    }.width(Const.FULL_WIDTH).height(Const.FULL_HEIGHT)
  }
  aboutToAppear(){
    if (this.progVal <= 150 && this.progColorVal <= 150) {
      this.time = setInterval(() => {
        this.progVal +=50;
        this.progColorVal +=50;
      },1000)

    }
    setTimeout(() => {
      clearInterval(this.time)
      router.pushUrl({
        url:'pages/Home',
        params:{
        acoparms:router.getParams()['acoParms']
      }
      })
    },3000)
  }
}