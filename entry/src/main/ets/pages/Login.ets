import router from '@ohos.router';
import Const from '../constants/CommonContent'

@Entry
@Component
struct Login {
  @State account: string = ''
  @State password: string = ''
  // @State registeraco:string = router.getParams()['accountparm']
  // @State registerpwd:string = router.getParams()['pwdParms']
  @State isSelect: boolean = false //默认为false

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
      Text('通鸿云课堂').fontSize(40).fontWeight(Const.FONT_BOLDER)
      Column() {
        TextInput({ placeholder: '请输入用户名' })
          .backgroundColor(0xd8bfd8)
          .fontSize(20)
          .fontWeight(Const.FONT_BOLDER)
          .width('80%')
          .height(50)
          .onChange((aco) => {
            this.account = aco;
          })
        TextInput({ placeholder: '请输入密码' })
          .backgroundColor(0xd8bfd8)
          .fontSize(20)
          .fontWeight(Const.FONT_BOLDER)
          .width('80%')
          .height(50)
          .margin({
            top: 30
          })
          .type(InputType.Password)
          .onChange((pwd) => {
            this.password = pwd;
          })

        Button('登录').width('80%').margin({
          top: 40
        })
          .onClick(() => {

            if (!this.isSelect) {
              AlertDialog.show({
                title: '提示',
                message: '请勾选同意隐私协议',
                autoCancel: true,
                confirm: {
                  value: '关闭',
                  action: () => {
                    console.info('confirm')
                  }
                }
              })
            } else if (this.account == '' && this.password == '') {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '输入内容为空，请重新输入',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  confirm: {
                    value: '关闭',
                    action: () => {
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else if (this.account == '' && this.password != '') {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '账号不能为空，请重新输入',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  confirm: {
                    value: '关闭',
                    action: () => {
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else if (this.password == '' && this.account != '') {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '密码不能为空，请重新输入',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  confirm: {
                    value: '关闭',
                    action: () => {
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else if (this.account != router.getParams()['accountparm']||this.password != router.getParams()['pwdParms'])
            {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '账号或密码错误',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  confirm: {
                    value: '关闭',
                    action: () => {
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else {
              router.pushUrl({
                url: 'pages/Home'
              })

            }

          })
        Button('注册').width('80%').margin({
          top: 15
        })
          .onClick(() => {
            router.pushUrl({ url: 'pages/Register' })
          })

        Divider()
          .vertical(false)
          .height(20)
          .color('#d8bfd8')
          .opacity(0.9)
          .margin({ left: 8, right: 8 })

      }

      Row() {
        Text('其他登录方式')
          .fontSize(20)
          .fontWeight(Const.FONT_BOLDER)
          .margin({ "top": "20.00vp", "right": "0.00px", "bottom": "0.00px", "left": "8" })
        Image($r('app.media.WeChat'))
          .width(30)
          .height(25)
          .margin({
            left: 30
          })
        Image($r('app.media.qq'))
          .width(30)
          .height(25)
          .margin({
            left: 30
          })
      }.margin({
        left: 8
      })

      Row() {
        Checkbox().select(this.isSelect)
          .onChange((select) => {
            this.isSelect = select;
          })
        Text('请勾选隐私协议')
      }
    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .backgroundImage($r('app.media.Login'))
    .backgroundImageSize(ImageSize.Cover)
  }
}