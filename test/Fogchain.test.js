const Fogchain =artifacts.require("Fogchain");
contract("Fogchain",(accounts)=>{
    before(async()=>{
        instance=await Fogchain.deployed()
    })

    it('Ensure block get added', async ()=>{
        
        await instance.store_doctor_details(1,"Ankush","eye",6614738,"hasnapur")
        let a= await instance.gettimestamp()
        console.log(a)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        let b= await instance.gettimestamp()
        console.log(b)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        let c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
        for (let i = 1; i <=25; i++) {
            await instance.store_doctor_details(i,"Ankush","eye",6614738,"hasnapur")
        }
        c= await instance.gettimestamp()
        console.log(c)
    })
})