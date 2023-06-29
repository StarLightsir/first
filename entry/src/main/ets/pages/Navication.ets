import Const from '../constants/CommonContent'
@Entry
@Component
struct NavigationExample {
    private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @State currentIndex: number = 0
    @State Build: Array<Object> = [
        {
            text: '首页',
            num: 0,
            path:$r('app.media.ic_public_home')
        },
        {
            text: '分类',
            num: 1,
            path: $r('app.media.ic_public_view_list')
        },
        {
            text: '社区',
            num: 2,
            path:$r('app.media.ic_gallery_discover')
        },
        {
            text:'我的',
            num: 3,
            path:$r('app.media.ic_user_portrait')
        }
    ]

    // @Builder NavigationMenus() {
    //     Row() {
    //         TextInput({ placeholder: 'search...' })
    //             .height(40)
    //             .width('90%')
    //             .backgroundColor('#FFFFFF')
    //
    //         Image($r('app.media.ic_public_home_filled'))
    //             .width(24)
    //             .height(24)
    //
    //     }
    //     .margin(Const.FULL_WIDTH)
    // }
    //
    // @Builder NavigationToolbar() {
    //     Row() {
    //         ForEach(this.Build, item => {
    //             Column() {
    //                 Image(item.path)
    //                     .width(24)
    //                     .height(24)
    //                 Text(item.text)
    //                     .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
    //                     .fontSize(10)
    //                     .lineHeight(14)
    //                     .fontWeight(500)
    //                     .margin({ top: 3 })
    //             }.width('15%').height(50).margin({left:'5%',right:'5%'})
    //             .onClick(() => {
    //                 this.currentIndex = item.num
    //             })
    //         })
    //     }.margin({ left: '10%' })
    // }

    build() {
        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
            Column(){
            Row() {
                TextInput({ placeholder: 'search...' })
                    .height(40)
                    .width('90%')
                    .backgroundColor('#d8bfd8')
                    .margin({right:'3%'})
                Image($r('app.media.ic_public_add_norm'))
                    .width(24)
                    .height(24)
            }
            .margin({
                top: '3%'
            })

            Column() {
                Navigation() {
                    List({ space: 12, initialIndex: 0 }) {
                        ForEach(this.arr, (item) => {
                            ListItem() {
                                Text('' + item)
                                    .width('90%')
                                    .height(70)
                                    .backgroundColor('#FFFFFF')
                                    .borderRadius(24)
                                    .fontSize(20)
                                    .fontWeight(Const.FONT_BOLDER)
                                    .textAlign(TextAlign.Center)
                            }.editable(true)
                        }, item => item)
                    }
                    .height(324)
                    .width('90%')
                    .margin({ top: '20%', left: '10%' })
                }
            }.width('100%').height('100%').backgroundColor('#F1F3F5')

                // .menus(this.NavigationMenus)
                // .toolBar(this.NavigationToolbar)
                // .hideToolBar(false)
                // .onTitleModeChange((titleModel: NavigationTitleMode) => {
                //     console.info('titleMode' + titleModel)
                // })
                Row() {
                    ForEach(this.Build, item => {
                        Column() {
                            Image(item.path)
                                .width(24)
                                .height(24)
                            Text(item.text)
                                .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
                                .fontSize(10)
                                .lineHeight(14)
                                .fontWeight(500)
                                .margin({ top: 3 })
                        }.width('15%').height(50).margin({ left: '5%', right: '5%' ,bottom:'10%'})
                        .onClick(() => {
                            this.currentIndex = item.num
                        })
                    })
                }.margin({ bottom: '10%'})
        }
        }
    }
}