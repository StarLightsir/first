import router from '@ohos.router';
import Const from '../constants/CommonContent'
@Entry
@Component
struct Register {
  @State account:string = ''
  @State password:string = ''
  @State confirmpwd:string = ''
  @State flag:Boolean = true

  build() {
    Flex({direction:FlexDirection.Column,justifyContent:FlexAlign.SpaceAround,alignItems:ItemAlign.Center}) {
      Text('注册').fontSize(40).fontWeight(Const.FONT_BOLDER)
      Column() {
        TextInput({ placeholder: '请输入账户' })
          .backgroundColor(0xd8bfd8)
          .fontSize(20)
          .fontWeight(Const.FONT_BOLDER)
          .width('80%')
          .height(40)
          .margin({
            top:0
          })
          .onChange((aco) => {
            this.account = aco;
          })

        TextInput({ placeholder: '请输入密码' })
          .backgroundColor(0xd8bfd8)
          .fontSize(20)
          .fontWeight(Const.FONT_BOLDER)
          .width('80%')
          .height(40)
          .margin({
            top: 20
          })
          .type(InputType.Password)
          .onChange((pwd) => {
            this.password = pwd;
          })
        TextInput({ placeholder: '请确认密码' })
          .backgroundColor(0xd8bfd8)
          .fontSize(20)
          .fontWeight(Const.FONT_BOLDER)
          .width('80%')
          .height(40)
          .margin({
            top: 20
          })
          .type(InputType.Password)
          .onChange((conpwd) => {
            this.confirmpwd = conpwd;
          })

        Button('注册').width('80%').margin({
          top: 25
        })
          .onClick(() => {

            if (this.account == '') {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '账号不能为空，请重新输入',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
              this.flag = false
            }
            else if (this.account.length < 8 ) {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '账户名太短，请至少输入8位',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
              this.flag = false
            }
            else if (this.password == '' ) {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '密码不能为空，请重新输入',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
              this.flag = false
            }
            else if (this.password.length < 8 ) {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '密码太短了，请至少输入八位',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
              this.flag = false
            }
            else if (this.confirmpwd == '' ) {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '请再次确认密码',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
              this.flag = false
            }
            else if (this.password != this.confirmpwd) {
              AlertDialog.show(
                {
                  title: '提示',
                  message: '密码不一致，请重新输入',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
              this.flag = false
            }
            else if (this.flag = true) {

              AlertDialog.show(
                {
                  title: '提示',
                  message: '注册成功',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'跳转到登录界面',
                    action:()=>{
                      console.info('confirm');
                      router.pushUrl({
                        url:('pages/Login'),
                        params:{accountparm:this.account,pwdParms:this.password}
                      })
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )

              // router.pushUrl({
              //   url:('pages/Login'),
              //   params:{accountparm:this.account,pwdParms:this.password}
              // })

            }


          })
        Button('返回').width('80%').margin({
          top: 25
        })
          .onClick(() => {
            router.pushUrl({
              url:('pages/Login'),
              params:{accountparm:this.account,pwdParms:this.password}
            })

          })
      }
      .margin({
        top:20
      })

    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .backgroundImage($r('app.media.Login'))
    .backgroundImageSize(ImageSize.Cover)
  }
}