![Desktop - 2](https://user-images.githubusercontent.com/63277563/171853421-d30e756a-6c59-46ed-8fac-0397406dcd7a.png)

## π» Coding Convention
<details markdown="1">
<summary>πλ€μ΄λ°</summary>

---

### Class & Struct
- ν΄λμ€/κ΅¬μ‘°μ²΄ μ΄λ¦μ **UpperCamelCase**λ₯Ό μ¬μ©ν©λλ€.
<br>

### ν¨μ, λ³μ, μμ
- ν¨μμ λ³μμλ **lowerCamelCase**λ₯Ό μ¬μ©ν©λλ€.
- λ²νΌλͺμλ **Btn μ½μ**λ₯Ό μ¬μ©ν©λλ€.
- λͺ¨λ  IBOutletμλ ν΄λΉ ν΄λμ€λͺμ λ€μ λΆμλλ€.  
  
  <kbd>μμΈ</kbd> Imageλ ν­μ Imgλ‘ μ€μ¬μ λ€μ΄λ°ν©λλ€.
  ```swift
  @IBOutlet weak var settingImgView: UIImageView!
    ```
- κΈ°λ³Έ ν΄λμ€ νμΌμ μμ±νκ±°λ μ»΄ν¬λνΈλ₯Ό μμ±ν  λλ μ½μ΄ κ·μΉμ λ°λΌ λ€μ΄λ°ν©λλ€.  

  - μμ
     
    `TV` `TVC` `CV` `CVC` `VC` `NVC` `TBC`
    
    ```Swift
    TableView -> TV
    TableViewCell -> TVC
    CollectionView -> CV
    CollectionView Cell -> CVC
    ViewController -> VC
    NavigationController -> NVC
    TabbarController -> TBC
    ```

  <kbd>μ’μ μ</kbd>
  ```swift
  @IBOutlet weak var createBtn: UIButton!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var mainPostTV: UITableView!
  ```
  
  <kbd>λμ μ</kbd>
  ```swift
  @IBOutlet weak var ScrollView: UIScrollView!
  @IBOutlet weak var categoryCollectionView: UICollectionView!
  @IBOutlet weak var tagCollectionView: UICollectionView!
  @IBOutlet weak var tableview: UITableView!
  ```

<br>

### ν¨μ λ€μ΄λ°
- `set` β setDelegate (κΈ°λ₯κ΄λ ¨ ν¨μ)
- `config` β configUI (UIκ΄λ ¨ ν¨μ)   
- `IBAction`β **tap**DismissBtn() : λ¨μ ν΄λ¦­, **present**ResultVC() : νλ©΄μ ν λ©μλ(push, present, pop, dismiss)

---

</details>

<details markdown="2">
<summary>π·μ£Όμ</summary>
 
---
	
### MARK μ£Όμ 

```

// MARK: IBOutlet

// MARK: Properties

// MARK: IBAction

// MARK: Life Cycle

// MARK: - UI

// MARK: - Custom Methods

// MARK: - νλ‘ν μ½λ€ νλμ© μ±νν΄μ Extension μΌλ‘ λΉΌκΈ° (TV, CV, .., Custom Delegate λͺ¨λ)

/// ~ νλ λ©μλ (ν¨μλ ν­μ λ¬Έμν)

// TODO: μμΌλ‘ ν  μΌμ TODOλ‘ μ μ΄λκΈ°
 
```
---
	
</details>

<details markdown="3">
<summary>β­οΈκ³΅λ°±</summary>

---
	
- ν­ μ¬μ΄μ¦λ 4λ‘ μ¬μ©ν©λλ€.
- ν μ€μ μ΅λ κΈΈμ΄λ 80μλ‘ μ νν©λλ€.
- μ΅λ tab depth μ ν
  - tabμ μ΅λ depthλ 4λ‘ μ νν©λλ€.
  - μ΄ μ΄μμΌλ‘ depthκ° κΈΈμ΄μ§λ©΄ ν¨μλ₯Ό ν΅ν΄ λλ μ μλλ‘ ν©λλ€.
  - κ·Έ μ΄μμΌλ‘ κ°μ ν  μ μλ€κ³  νλ¨λλ κ²½μ°, νμλ€κ³Όμ μ½λλ¦¬λ·°λ₯Ό ν΅ν΄ κ°μ ν©λλ€.  
   
- κ΄νΈ μ¬μ©
  - (if, while, for)λ¬Έ κ΄νΈ λ€μ νμΉΈμ λμ°κ³  μ¬μ©ν©λλ€.
 
  ```Swift
     if (left == true) {
	   // logic
     }
     ```
  
- λμ΄μ°κΈ°
 
  ```Swift
  let a = 5; // μμͺ½ μ¬μ΄λ‘ λμ΄μ°κΈ° νκΈ°
  if (a == 3) {
	// logic
  }
  ```

---
	
</details>

<details markdown="4">
<summary>πΈκΈ°νκ·μΉ</summary>  

---
 
 - μΈλΆμμ μ¬μ©λμ§ μμ λ³μλ ν¨μλ `private`μΌλ‘ μ μΈν©λλ€.
 - **viewDidLoad()** μ κ°μ μλͺμ£ΌκΈ° ν¨μλ€μλ `function`λ§ μμΉμν΅λλ€.
 - λΆνμν selfλ μ§μν©λλ€.
     <kbd>μμΈ</kbd> ν΄λ‘μ λ₯Ό μ¬μ©ν  λλ μμ²΄ ν¨μμ selfλ₯Ό λΆμ¬μ€λλ€.
 - **Extension** μ μ¬μ©ν΄ κΈ°λ₯ λ¨μλ‘ μ½λλ₯Ό λ κ°λμ±μκ² κ΅¬λΆν©λλ€.

    `<κΈ°λ³Έ ν΄λμ€μ λ°°μΉλλ κ²>` 
	- IBOutlet, Properties, LifeCycle, IBAction
	
    `<Extension λ°°μΉ μμ>` 

    ```
    1. UI
    2. custom Methods
    3. delegate (extensionμΌλ‘ λΉΌλ νλ‘ν μ½λ€ μμ λ‘­κ²)
    4. λΈν°, ν€λ³΄λ λ±λ± 
    5. Network
    ```
---
	
</details>

<br>
	

## π Foldering Convention
<details>
<summary> π ZEPETO-iOS Foldering Convention π </summary>
<div markdown="1"> 

```
 ZEPETO-iOS
    βββπ Global
    β   βββ LaunchScreen.storyboard
    β   βββ PublicData
    β   βββ Factory
    β   βββ Class 
    β   βββ Struct
    β   βββ Protocol
    β   βββ Extension
    β   
    βββπ Network
    β   βββ Bases
    β   βββ APIEssentials
    β   βββ Services
    β   βββ APIModels
    β   βββ APIManagers
    β   βββ EventLogger.swift
    β
    βββπ Screen
    β   βββ CreateMain
    β       βββ SB
    β       βββ VC
    β       βββ Cell
    βββπ Support
        βββ AppDelegate.swift
        βββ SceneDelegate.swift
        βββ Assets.xcassets
        βββ Colorsets.xcassets
        βββ Info.plist
``` 
</details>
	
<br>

## βοΈ Commit Convention

```
[CHORE] μ½λ μμ , λ΄λΆ νμΌ μμ  
[FEAT] : μλ‘μ΄ κΈ°λ₯ κ΅¬ν 
[ADD] : Feat μ΄μΈμ λΆμμ μΈ μ½λ μΆκ°, λΌμ΄λΈλ¬λ¦¬ μΆκ°, μλ‘μ΄ νμΌ μμ± μ, μμ
[HOTFIX] : issueλ, QAμμ κΈν λ²κ·Έ μμ μ μ¬μ©
[FIX] : λ²κ·Έ, μ€λ₯ ν΄κ²° 
[DEL] : μΈλͺ¨μλ μ½λ μ­μ  
[DOCS] : READMEλ WIKI λ±μ λ¬Έμ κ°μ 
[MOVE] : νλ‘μ νΈ λ΄ νμΌμ΄λ μ½λμ μ΄λ  
[REFACTOR] : μ λ©΄ μμ μ΄ μμ λ μ¬μ©
```

<br>

## β¨Github Management
<details>
<summary> π ZEPETO-iOS Gitflow π </summary>
<div markdown="1">  

```
1. Issueλ₯Ό μμ±νλ€.
2. feature Branchλ₯Ό μμ±νλ€.
3. Add - Commit - Push - Pull Request μ κ³Όμ μ κ±°μΉλ€.
4. Pull Requestκ° μμ±λλ©΄ μμ±μ μ΄μΈμ λ€λ₯Έ νμμ΄ 24μκ° μ΄λ΄μ Code Reviewλ₯Ό νλ€.
5. Code Reviewκ° μλ£λλ©΄ Pull Request μμ±μκ° develop Branchλ‘ merge νλ€.
6. μ’λ£λ Issueμ Pull Requestμ Labelκ³Ό Projectλ₯Ό κ΄λ¦¬νλ€.
```
	
### π΄ λΈλμΉ
---
#### π λΈλμΉ λ¨μ
- λΈλμΉ λ¨μ = μ΄μ λ¨μ = PRλ¨μ

#### π λΈλμΉλͺ
- λΈλμΉλ λ·° λ¨μλ‘ μμ±ν©λλ€. (**'UI / Func'** λ‘ κΈ°λ₯ μΈλΆ κ΅¬λΆ)
- λΈλμΉ κ·μΉ β feature/#μ΄μλ²νΈ-(UI/Func)-ν­(μ€ν¬λ¦°)-κΈ°λ₯κ°λ΅μ€λͺ
- `ex) feature/#1-UI-Main-MakeNaviBar`

<br>
	
### π‘ μ΄μ, PR κ·μΉ
---
#### π Issueλͺ = PRλͺ
- β¨ [FEAT]
- β [ADD]
- π¨ [FIX]
- β»οΈ [REFACTOR]
- β [CHORE]

</details>
<br>
