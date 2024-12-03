//
//  DefineProperty.h
//  FM
//
//  Created by Admin on 3/12/2024.
//

#ifndef DefineProperty_h
#define DefineProperty_h

#ifndef Prop
#define Prop(s, ...) @property(nonatomic, s, ##__VA_ARGS__)
#endif /* Prop */

#ifndef Prop_strong
#define Prop_strong(...) @property(nonatomic, strong, ##__VA_ARGS__)
#endif /* Prop_strong */

#ifndef Prop_copy
#define Prop_copy(...) @property(nonatomic, copy, ##__VA_ARGS__)
#endif /* Prop_copy */

#ifndef Prop_assign
#define Prop_assign(...) @property(nonatomic, assign, ##__VA_ARGS__)
#endif /* Prop_assign */

#ifndef Prop_retain
#define Prop_retain(...) @property(nonatomic, retain, ##__VA_ARGS__)
#endif /* Prop_retain */

#endif /* DefineProperty_h */
