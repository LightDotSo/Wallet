import type { Story, Meta } from "@storybook/react";

import { Page } from "../Page";

import { SignTransaction } from "./SignTransaction";

export default {
  title: "SignTransaction",
  component: SignTransaction,
  argTypes: {},
} as Meta;

const Template: Story = args => {
  return <Page id={1} type="SignTransaction" params={""} method="" />;
};

export const UniswapGoerliWrap: Story = args => {
  return (
    <Page
      id={2}
      type="SignTransaction"
      params={{
        from: "0xd77d7a55d10a9d26ee838453973d40a287322587",
        to: "0xb4fbf271143f4fbf7b91a5ded31805e42b2208d6",
        data: "0xd0e30db0",
        value: "0x2386f26fc10000",
      }}
      method=""
    />
  );
};

export const UniswapGoerliSwap: Story = args => {
  return (
    <Page
      id={3}
      type="SignTransaction"
      params={{
        from: "0xd77d7a55d10a9d26ee838453973d40a287322587",
        to: "0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45",
        data: "0x5ae401dc00000000000000000000000000000000000000000000000000000000638bf5e40000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000124b858183f00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000080000000000000000000000000d77d7a55d10a9d26ee838453973d40a287322587000000000000000000000000000000000000000000000000002386f26fc10000000000000000000000000000000000000000000000000000003e4dbc9069d3d00000000000000000000000000000000000000000000000000000000000000042b4fbf271143f4fbf7b91a5ded31805e42b2208d6000bb807865c6e87b9f70255377e024ace6630c1eaa37f000bb81f9840a85d5af5bf1d1762f925bdaddc4201f98400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        value: "0x2386f26fc10000",
      }}
      method=""
    />
  );
};

export const UniswapDAIApproval: Story = args => {
  return (
    <Page
      id={4}
      type="SignTransaction"
      params={{
        from: "0xd77d7a55d10a9d26ee838453973d40a287322587",
        to: "0x11fe4b6ae13d2a6055c8d9cf65c55bac32b5d844",
        data: "0x095ea7b300000000000000000000000068b3465833fb72a70ecdf485e0e4c7bd8665fc45ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
        value: "0x0",
      }}
      method=""
    />
  );
};

export const OpenseaSellApproval: Story = args => {
  return (
    <Page
      id={5}
      type="SignTransaction"
      params={{
        from: "0xdfd8e7d041c31261da027ebe8ce9ede05deae801",
        to: "0xf5de760f2e916647fd766b4ad9e85ff943ce3a2b",
        data: "0xa22cb4650000000000000000000000001e0049783f008a0085193e00003d00cd54003c710000000000000000000000000000000000000000000000000000000000000001",
        value: "0x",
      }}
      method=""
    />
  );
};

export const NFTTransfer: Story = args => {
  return (
    <Page
      id={6}
      type="SignTransaction"
      params={{
        from: "0xdfd8e7d041c31261da027ebe8ce9ede05deae801",
        to: "0xf5de760f2e916647fd766b4ad9e85ff943ce3a2b",
        data: "0x42842e0e000000000000000000000000dfd8e7d041c31261da027ebe8ce9ede05deae8010000000000000000000000004fd9d0ee6d6564e80a9ee00c0163fc952d0a45ed00000000000000000000000000000000000000000000000000000000000d64e3",
        value: "0x",
      }}
      method=""
    />
  );
};

export const SendETH: Story = args => {
  return (
    <Page
      id={7}
      type="SignTransaction"
      params={{
        from: "0xd77d7a55d10a9d26ee838453973d40a287322587",
        to: "0x225e9b54f41f44f42150b6aaa730da5f2d23faf2",
        value: "0x83e3ed8225fc3",
      }}
      method=""
    />
  );
};

export const SliceTransfer: Story = args => {
  return (
    <Page
      id={8}
      type="SignTransaction"
      params={{
        from: "0xdfd8e7d041c31261da027ebe8ce9ede05deae801",
        to: "0x115978100953d0aa6f2f8865d11dc5888f728370",
        data: "0xf242432a000000000000000000000000dfd8e7d041c31261da027ebe8ce9ede05deae8010000000000000000000000004fd9d0ee6d6564e80a9ee00c0163fc952d0a45ed00000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000bb800000000000000000000000000000000000000000000000000000000000000a00000000000000000000000000000000000000000000000000000000000000000",
        value: "0x",
      }}
      method=""
    />
  );
};

export const ErrorTokenContractTransfer: Story = args => {
  return (
    <Page
      id={9}
      type="SignTransaction"
      params={{
        data: "0xa9059cbb000000000000000000000000b4fbf271143f4fbf7b91a5ded31805e42b2208d6000000000000000000000000000000000000000000000000002386f26fc10000",
        to: "0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6",
        from: "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266",
        value: "0x0",
      }}
      method=""
    />
  );
};

export const Default = Template.bind({});
