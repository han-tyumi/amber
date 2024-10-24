import type { CustomType, List } from "prelude";
import type { Constructor } from "type-fest";

export type CustomTypeToOptions<T extends CustomType, O extends object> = (
  instance: T,
) => Partial<O> | null | undefined;

export class CustomTypeOptionsMap<O extends object> extends WeakMap<
  Constructor<CustomType>,
  CustomTypeToOptions<CustomType, O>
> {
  constructor() {
    super();
  }

  override set<T extends CustomType>(
    key: Constructor<T>,
    value: CustomTypeToOptions<T, O>,
  ): this {
    return super.set(
      key,
      value as CustomTypeToOptions<CustomType, O>,
    );
  }

  override get<T extends CustomType>(
    key: Constructor<T>,
  ): CustomTypeToOptions<T, O> | undefined {
    return super.get(key);
  }

  customTypeListToOptions(customTypeList: List<CustomType>): Partial<O> {
    const options: Partial<O> = {};
    for (const customType of customTypeList) {
      const customTypeToOptions = this.get(
        customType.constructor as Constructor<CustomType>,
      );
      const additionalOptions = customTypeToOptions?.(customType);
      if (additionalOptions) {
        Object.assign(options, additionalOptions);
      }
    }
    return options;
  }
}
